import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/blocs/diet/diet_bloc.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/utils/local_widgets.dart';
import 'package:nutrition_app/utils/utils.dart';
import '../blocs/ingredients_page/ingredients_page_bloc.dart';
import '../blocs/init/init_bloc.dart';
import 'meal_page.dart';

class DietPage extends StatelessWidget {
  final Diet diet;

  const DietPage(this.diet, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DietBloc(diet),
      child: Scaffold(
        appBar: AppBar(title: Text(diet.name)),
        drawer: DietDrawer(diet),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 16, 4, 3),
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        'Average Day Breakdown:',
                        style: TextStyle(fontSize: 27),
                      )),
                    ),
                    BlocBuilder<DietBloc, DietState>(
                      builder: (context, state) {
                        return DayStyleNutrientDisplay(
                            state.diet.averageNutrition, state.diet.dris);
                      },
                      buildWhen: (pre, curr) {
                        return affectsNutrition(curr);
                      },
                    ),
                  ],
                ),
              ),
            ),
            PlusSignTile((context) {
              context.read<DietBloc>().add(AddDay());
            }),
            BlocBuilder<DietBloc, DietState>(
              builder: (context, state) {
                return ReorderableListView.builder(
                  itemCount: state.diet.days.length,
                  itemBuilder: (context, index) => BlocProvider.value(
                    value: context.read<DietBloc>(),
                    key: Key(index.toString()),
                    child: DayTile(
                      state.diet.days[index],
                    ),
                  ),
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  onReorder: (int old, int new_) {
                    context.read<DietBloc>().add(ReorderDay(old, new_));
                  },
                );
              },
              buildWhen: (pre, curr) => curr is! DayState,
            )
            // ...diet.days.map((e) => DayTile(e))
          ],
        ),
      ),
    );
  }
}

// Widget dayTile(Day day, BuildContext context){
//   return ExpansionTile(
//     title: Center(child: Text('Day ${day.name}')),
//     subtitle: Center(child: nutrientText(nutrients: day.nutrients, initText: '')),
//     // trailing: PopupMenuButton(
//     //   itemBuilder: (BuildContext context) => [
//     //   PopupMenuItem(value: DayPopUpEnumHolder(day, PopUpOptions.edit),child: const Text('Edit'),),
//     //   PopupMenuItem(value: DayPopUpEnumHolder(day, PopUpOptions.delete), child: const Text('Delete')),
//     //   PopupMenuItem(value: DayPopUpEnumHolder(day, PopUpOptions.duplicate),child: const Text('Duplicate'),),
//     //   ]),
//     children: [
//       dayStyleNutrientDisplay(day.nutrients, diet.dris),
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: PlusSignTile((context) {}),
//       ),
//       ...day.meals.map<Widget>((e) => mealComponentTile(e, context))
//     ],
//
//   );
// }

// TODO Day Bloc
// TODO Some Kind of Meal Component Controller (maybe within day bloc)

class DayTile extends StatelessWidget {
  final Day day;

  const DayTile(this.day, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dietBloc = context.read<DietBloc>();
    return ExpansionTile(
      title: Center(child: BlocBuilder<DietBloc, DietState>(
        builder: (context, state) {
          return Text('Day ${day.name}');
        },
        buildWhen: (_, state) => state is ReorderDayState || state is DeleteDayState,
      )),
      controlAffinity: ListTileControlAffinity.leading,
      subtitle: BlocBuilder<DietBloc, DietState>(
        builder: (context, state) {
          return Center(
              child: NutrientText(nutrients: day.nutrients, initText: ''));
        },
        buildWhen: (pre, curr) =>
            curr is DayState && (curr as DayState).day == day,
      ),
      trailing: PopupMenuButton(
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(
            value: DayPopUpEnumHolder(day, PopUpOptions.edit),
            child: const Text('Edit'),
          ),
          PopupMenuItem(
              value: DayPopUpEnumHolder(day, PopUpOptions.delete),
              child: const Text('Delete')),
          PopupMenuItem(
            value: DayPopUpEnumHolder(day, PopUpOptions.duplicate),
            child: const Text('Duplicate'),
          ),
        ],
        onSelected: (val) {
          switch (val.popUpOption) {
            case PopUpOptions.edit:
              // TODO: Handle this case.
              break;
            case PopUpOptions.delete:
              dietBloc.add(DeleteDay(val.day));
              break;
            case PopUpOptions.duplicate:
              dietBloc.add(DuplicateDay.fromDay(dietBloc.state.diet, val.day));
              break;
          }
        },
      ),
      children: [
        BlocBuilder<DietBloc, DietState>(
          builder: (context, state) {
            return DayStyleNutrientDisplay(
                day.nutrients, dietBloc.state.diet.dris);
          },
          buildWhen: (pre, curr) =>
              curr is DayState && (curr as DayState).day == day,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PlusSignTile((_) async {
            final result = await Navigator.push(
                context,
                MaterialPageRoute(
                    settings: const RouteSettings(name: "/IngredientsPage"),
                    builder: (_) => BlocProvider(
                        create: (context) => IngredientsPageBloc(
                            context.read<InitBloc>().state.app!, MCFTypes.meal,
                            include: true, backRef: true),
                        child: const MealPage())));
            if (result is Meal) {
              // final serving = result.toServing();
              dietBloc.add(AddMealToDay(result, day));
            }
          }),
        ),
        BlocBuilder<DietBloc, DietState>(
          builder: (context, state) {
            return ReorderableListView.builder(
              itemBuilder: (BuildContext context, int index) => MCTile(
                day.meals[index],
                onGramsChange:
                    (MealComponent meal, num grams, String servingValue) {
                  dietBloc.add(MealUpdateGrams(
                      index: index,
                      day: day,
                      serving: servingValue,
                      value: grams));
                },
                // onEdit: (MealComponent meal) {},
                onDelete: (MealComponent meal) {
                  dietBloc.add(DeleteMealFromDay(index, day));
                },
                onDuplicate: (MealComponent meal){
                  dietBloc.add(DuplicateMealInDay(meal, day));
                },
                key: KeyHolder<Day, int, void, void, void, void>(
                        value1: day, value2: index)
                    .key(),
              ),
              itemCount: day.meals.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              onReorder: (int old, int new_) {
                if (old == new_) {
                  return;
                }
                dietBloc.add(ReorderMealInDay(day: day, new_: new_, old: old));
              },
            );
          },
          buildWhen: (pre, curr) =>
              curr is DayState && (curr as DayState).day == day,
        )
        // ...day.meals.map<Widget>((e) => MealComponentTile(e))
      ],
    );
  }
}

class MealComponentPopUpEnumHolder {
  MealComponent mealComponent;
  PopUpOptions popUpOption;

  MealComponentPopUpEnumHolder(this.mealComponent, this.popUpOption);
}

class DayPopUpEnumHolder {
  Day day;
  PopUpOptions popUpOption;

  DayPopUpEnumHolder(this.day, this.popUpOption);
}

// Widget mealComponentTile(MealComponent meal, BuildContext context){
//   // return ListTile(
//   //   title: Row(
//   //     children: [
//   //       Text(meal.name),
//   //       Flexible(
//   //         child: TextFormField(initialValue: roundDecimal(meal.grams.toDouble(), 3).toString(),
//   //           decoration: const InputDecoration(
//   //             contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//   //             border: InputBorder.none
//   //         ),
//   //           inputFormatters: <TextInputFormatter>[
//   //             FilteringTextInputFormatter.allow(RegExp(r'[\d.]+'))
//   //           ],
//   //           keyboardType: const TextInputType.numberWithOptions(decimal: true),),
//   //       ),
//   //       DropdownButton<String>(
//   //         value: 'grams',
//   //           items: meal.reference.altMeasures2grams.keys.map<DropdownMenuItem<String>>
//   //             ((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
//   //           onChanged: (String? newAltMeasure){})
//   //
//   //     ],
//   //   ),
//   //   trailing: PopupMenuButton(
//   //     itemBuilder: (BuildContext context) => [
//   //       PopupMenuItem(value: MealComponentPopUpEnumHolder(meal, PopUpOptions.edit),child: const Text('Edit'),),
//   //       PopupMenuItem(value: MealComponentPopUpEnumHolder(meal, PopUpOptions.delete), child: const Text('Delete')),
//   //       PopupMenuItem(value: MealComponentPopUpEnumHolder(meal, PopUpOptions.duplicate),child: const Text('Duplicate'),),
//   //     ],
//   //   ),
//   //   subtitle: nutrientText(nutrients: meal.nutrients, grams: meal.grams.round()),
//   //   // subtitle: RichText(
//   //   //   text: TextSpan(
//   //   //     children:[
//   //   //       TextSpan(text: 'Serving:  '),
//   //   //       TextSpan(text: "${meal.baseNutrient.nutrients.calories.value.round()}\u{1F525}  "),
//   //   //       TextSpan(text: '\u{1F525}  ', style: TextStyle(fontFamily: 'EmojiOne')),
//   //   //       TextSpan(text: '${meal.baseNutrient.nutrients.carbohydrate.value.round()}\u{1F35E}  '),
//   //   //       TextSpan(text: '\u{1F35E}  ', style: TextStyle(fontFamily: 'EmojiOne')),
//   //   //       TextSpan(text: '${meal.baseNutrient.nutrients.protein.value.round()}\u{1F969}  '),
//   //   //       TextSpan(text: '\u{1F969}  ', style: TextStyle(fontFamily: 'EmojiOne')),
//   //   //       // '${meal.baseNutrient.nutrients.unsaturatedFat.value.round()}\u{1FAD2}  '
//   //   //       TextSpan(text: '${meal.baseNutrient.nutrients.unsaturatedFat.value.round()}$olive  '),
//   //   //       TextSpan(text: '$olive  ', style: GoogleFonts.notoColorEmoji()),
//   //   //       // '${meal.baseNutrient.nutrients.saturatedFat.value.round()}\u{1F9C8}',
//   //   //       TextSpan(text: '${meal.baseNutrient.nutrients.saturatedFat.value.round()}$butter'),
//   //   //       TextSpan(text: '$butter  ', style: GoogleFonts.notoColorEmoji()),
//   //   //     ]
//   //   //   )
//   //   // ),
//   //   leading: getImage(meal.reference.photo),
//   //   onTap: (){},
//   // );
//   Widget trailing = PopupMenuButton(
//     itemBuilder: (BuildContext context) => [
//       PopupMenuItem(value: MealComponentPopUpEnumHolder(meal, PopUpOptions.edit),child: const Text('Edit'),),
//       PopupMenuItem(value: MealComponentPopUpEnumHolder(meal, PopUpOptions.delete), child: const Text('Delete')),
//       PopupMenuItem(value: MealComponentPopUpEnumHolder(meal, PopUpOptions.duplicate),child: const Text('Duplicate'),),
//     ],
//   );
//   if (meal.reference is Meal){
//     final temp = meal.reference as Meal;
//     if (toBool(temp.notes)){
//       trailing = Row(
//         mainAxisSize: MainAxisSize.min,
//       children: [
//         IconButton(
//           onPressed: ()
//             {showDialog(context: context, builder: (context)=>mealNotesPopUp(meal.reference as Meal, context));},
//           icon: const Icon(Icons.info_outline),),
//         PopupMenuButton(
//           itemBuilder: (BuildContext context) => [
//             PopupMenuItem(value: MealComponentPopUpEnumHolder(meal, PopUpOptions.edit),child: const Text('Edit'),),
//             PopupMenuItem(value: MealComponentPopUpEnumHolder(meal, PopUpOptions.delete), child: const Text('Delete')),
//             PopupMenuItem(value: MealComponentPopUpEnumHolder(meal, PopUpOptions.duplicate),child: const Text('Duplicate'),),
//           ],
//         )
//       ],
//     );
//     }
//   }
//
//   return ExpansionTile(
//     trailing: trailing,
//     // subtitle: nutrientText(nutrients: meal.nutrients, grams: meal.grams.round()),
//     // subtitle: RichText(
//     //   text: TextSpan(
//     //     children:[
//     //       TextSpan(text: 'Serving:  '),
//     //       TextSpan(text: "${meal.baseNutrient.nutrients.calories.value.round()}\u{1F525}  "),
//     //       TextSpan(text: '\u{1F525}  ', style: TextStyle(fontFamily: 'EmojiOne')),
//     //       TextSpan(text: '${meal.baseNutrient.nutrients.carbohydrate.value.round()}\u{1F35E}  '),
//     //       TextSpan(text: '\u{1F35E}  ', style: TextStyle(fontFamily: 'EmojiOne')),
//     //       TextSpan(text: '${meal.baseNutrient.nutrients.protein.value.round()}\u{1F969}  '),
//     //       TextSpan(text: '\u{1F969}  ', style: TextStyle(fontFamily: 'EmojiOne')),
//     //       // '${meal.baseNutrient.nutrients.unsaturatedFat.value.round()}\u{1FAD2}  '
//     //       TextSpan(text: '${meal.baseNutrient.nutrients.unsaturatedFat.value.round()}$olive  '),
//     //       TextSpan(text: '$olive  ', style: GoogleFonts.notoColorEmoji()),
//     //       // '${meal.baseNutrient.nutrients.saturatedFat.value.round()}\u{1F9C8}',
//     //       TextSpan(text: '${meal.baseNutrient.nutrients.saturatedFat.value.round()}$butter'),
//     //       TextSpan(text: '$butter  ', style: GoogleFonts.notoColorEmoji()),
//     //     ]
//     //   )
//     // ),
//     leading: GetImage(meal.reference.photo),
//     title: Text(meal.name),
//     expandedCrossAxisAlignment: CrossAxisAlignment.center,
//     // childrenPadding: const EdgeInsets.fromLTRB(40, 0, 0, 5),
//     children: [
//         Padding(
//           padding: const EdgeInsets.fromLTRB(0, 10, 0, 2),
//           child: MealStyleNutrientDisplay(meal.nutrients),
//         ),
//         const Text('Serving Size: ', style: TextStyle(fontSize: 16),),
//         TextFormField(
//           initialValue: meal.grams.isInt ? meal.grams.toInt().toString() : roundDecimal(meal.grams.toDouble(), 3).toString(),
//           textAlign: TextAlign.center,
//           decoration: const InputDecoration(
//             contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//             border: InputBorder.none,
//             // label: Center(child: Text('grams')),
//             // alignLabelWithHint: true,
//             // hintText: 'grams',
//         ),
//           inputFormatters: <TextInputFormatter>[
//             FilteringTextInputFormatter.allow(RegExp(r'[\d.]+'))
//           ],
//           keyboardType: const TextInputType.numberWithOptions(decimal: true),
//         ),
//         DropdownButton<String>(
//           value: 'grams',
//             items: meal.reference.altMeasures2grams.keys.map<DropdownMenuItem<String>>
//               ((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
//             onChanged: (String? newAltMeasure){})
//
//       ],
//   );
// }

AlertDialog mealNotesPopUp(Meal meal, BuildContext context) => AlertDialog(
      title: Text(meal.name),
      content: Text(meal.notes),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Return'))
      ],
    );
