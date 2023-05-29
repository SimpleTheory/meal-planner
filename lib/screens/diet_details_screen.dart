import 'package:ari_utils/ari_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/blocs/diet/diet_bloc.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/temp_dummy_data.dart';
import 'package:nutrition_app/utils/local_widgets.dart';
import 'package:nutrition_app/utils/utils.dart';

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
                return ListView.builder(
                  itemCount: state.diet.days.length,
                  itemBuilder: (context, index) => DayTile(state.diet.days[index]),
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                );
              },
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
    return ExpansionTile(
      title: Center(child: Text('Day ${day.name}')),
      controlAffinity: ListTileControlAffinity.leading,
      subtitle:
      Center(child: NutrientText(nutrients: day.nutrients, initText: '')),
      trailing: PopupMenuButton(
        itemBuilder: (BuildContext context) => [
        PopupMenuItem(value: DayPopUpEnumHolder(day, PopUpOptions.edit),child: const Text('Edit'),),
        PopupMenuItem(value: DayPopUpEnumHolder(day, PopUpOptions.delete), child: const Text('Delete')),
        PopupMenuItem(value: DayPopUpEnumHolder(day, PopUpOptions.duplicate),child: const Text('Duplicate'),),
        ]),
      children: [
        DayStyleNutrientDisplay(day.nutrients, diet.dris),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PlusSignTile((context) {}),
        ),
        ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              MealComponentTile(day.meals[index]),
          itemCount: day.meals.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
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

class MealComponentTile extends StatelessWidget {
  final MealComponent meal;
  final expansionController = ExpansionTileController();
  MealComponentTile(this.meal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      controlAffinity: ListTileControlAffinity.trailing,
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        if (meal.reference is Meal)
          if (toBool((meal.reference as Meal).notes))
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) =>
                        mealNotesPopUp(meal.reference as Meal, context));
              },
              icon: const Icon(Icons.info_outline),
            ),
        PopupMenuButton(
          itemBuilder: (BuildContext context) =>
          [
            PopupMenuItem(
              value: MealComponentPopUpEnumHolder(meal, PopUpOptions.edit),
              child: const Text('Edit'),
            ),
            PopupMenuItem(
                value: MealComponentPopUpEnumHolder(meal, PopUpOptions.delete),
                child: const Text('Delete')),
            PopupMenuItem(
              value: MealComponentPopUpEnumHolder(meal, PopUpOptions.duplicate),
              child: const Text('Duplicate'),
            ),
          ],
        ),
        ExpandIcon(onPressed: (bool val){val ? expansionController.expand() :
          expansionController.collapse();})
      ]),
      // subtitle: nutrientText(nutrients: meal.nutrients, grams: meal.grams.round()),
      // subtitle: RichText(
      //   text: TextSpan(
      //     children:[
      //       TextSpan(text: 'Serving:  '),
      //       TextSpan(text: "${meal.baseNutrient.nutrients.calories.value.round()}\u{1F525}  "),
      //       TextSpan(text: '\u{1F525}  ', style: TextStyle(fontFamily: 'EmojiOne')),
      //       TextSpan(text: '${meal.baseNutrient.nutrients.carbohydrate.value.round()}\u{1F35E}  '),
      //       TextSpan(text: '\u{1F35E}  ', style: TextStyle(fontFamily: 'EmojiOne')),
      //       TextSpan(text: '${meal.baseNutrient.nutrients.protein.value.round()}\u{1F969}  '),
      //       TextSpan(text: '\u{1F969}  ', style: TextStyle(fontFamily: 'EmojiOne')),
      //       // '${meal.baseNutrient.nutrients.unsaturatedFat.value.round()}\u{1FAD2}  '
      //       TextSpan(text: '${meal.baseNutrient.nutrients.unsaturatedFat.value.round()}$olive  '),
      //       TextSpan(text: '$olive  ', style: GoogleFonts.notoColorEmoji()),
      //       // '${meal.baseNutrient.nutrients.saturatedFat.value.round()}\u{1F9C8}',
      //       TextSpan(text: '${meal.baseNutrient.nutrients.saturatedFat.value.round()}$butter'),
      //       TextSpan(text: '$butter  ', style: GoogleFonts.notoColorEmoji()),
      //     ]
      //   )
      // ),
      leading: GetImage(meal.reference.photo),
      title: Text(meal.name),
      expandedCrossAxisAlignment: CrossAxisAlignment.center,
      onExpansionChanged: (exp){},
      controller: expansionController,
      // childrenPadding: const EdgeInsets.fromLTRB(40, 0, 0, 5),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 2),
          child: MealStyleNutrientDisplay(meal.nutrients),
        ),
        const Text(
          'Serving Size',
          style: TextStyle(fontSize: 16),
        ),
        TextFormField(
          initialValue: meal.grams.isInt
              ? meal.grams.toInt().toString()
              : roundDecimal(meal.grams.toDouble(), 3).toString(),
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            border: InputBorder.none,
            // label: Center(child: Text('grams')),
            // alignLabelWithHint: true,
            // hintText: 'grams',
          ),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
          ],
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        DropdownButton<String>(
            value: 'grams',
            items: meal.reference.altMeasures2grams.keys
                .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (String? newAltMeasure) {})
      ],
    );
  }
}

class MCTile extends StatefulWidget {
  MealComponent meal;
  final expansionController = ExpansionTileController();
  late final textController = TextEditingController(text: meal.grams.isInt
      ? meal.grams.toInt().toString()
      : roundDecimal(meal.grams.toDouble(), 3).toString());
  MCTile(this.meal, {Key? key}) : super(key: key);
  String servingValue = 'grams';

  @override
  State<MCTile> createState() => _MCTileState();
}

class _MCTileState extends State<MCTile> {
  bool _isExpanded = false;
  _getAltMeasure(String alt) => widget.meal.reference.altMeasures2grams[alt]!;


  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      controlAffinity: ListTileControlAffinity.trailing,
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        if (widget.meal.reference is Meal)
          if (toBool((widget.meal.reference as Meal).notes))
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) =>
                        mealNotesPopUp(widget.meal.reference as Meal, context));
              },
              icon: const Icon(Icons.info_outline),
            ),
        PopupMenuButton(
          itemBuilder: (BuildContext context) =>
          [
            PopupMenuItem(
              value: MealComponentPopUpEnumHolder(widget.meal, PopUpOptions.edit),
              child: const Text('Edit'),
            ),
            PopupMenuItem(
                value: MealComponentPopUpEnumHolder(widget.meal, PopUpOptions.delete),
                child: const Text('Delete')),
            PopupMenuItem(
              value: MealComponentPopUpEnumHolder(widget.meal, PopUpOptions.duplicate),
              child: const Text('Duplicate'),
            ),
          ],
        ),
        ExpandIcon(
            isExpanded: _isExpanded,
            onPressed: (bool currentExpansion){
          print(currentExpansion);
          !currentExpansion ? widget.expansionController.expand() :
          widget.expansionController.collapse();
          setState(() {
            _isExpanded = !currentExpansion;
          });
            }
          )
        ]
      ),
      // subtitle: nutrientText(nutrients: widget.meal.nutrients, grams: widget.meal.grams.round()),
      // subtitle: RichText(
      //   text: TextSpan(
      //     children:[
      //       TextSpan(text: 'Serving:  '),
      //       TextSpan(text: "${widget.meal.baseNutrient.nutrients.calories.value.round()}\u{1F525}  "),
      //       TextSpan(text: '\u{1F525}  ', style: TextStyle(fontFamily: 'EmojiOne')),
      //       TextSpan(text: '${widget.meal.baseNutrient.nutrients.carbohydrate.value.round()}\u{1F35E}  '),
      //       TextSpan(text: '\u{1F35E}  ', style: TextStyle(fontFamily: 'EmojiOne')),
      //       TextSpan(text: '${widget.meal.baseNutrient.nutrients.protein.value.round()}\u{1F969}  '),
      //       TextSpan(text: '\u{1F969}  ', style: TextStyle(fontFamily: 'EmojiOne')),
      //       // '${widget.meal.baseNutrient.nutrients.unsaturatedFat.value.round()}\u{1FAD2}  '
      //       TextSpan(text: '${widget.meal.baseNutrient.nutrients.unsaturatedFat.value.round()}$olive  '),
      //       TextSpan(text: '$olive  ', style: GoogleFonts.notoColorEmoji()),
      //       // '${widget.meal.baseNutrient.nutrients.saturatedFat.value.round()}\u{1F9C8}',
      //       TextSpan(text: '${widget.meal.baseNutrient.nutrients.saturatedFat.value.round()}$butter'),
      //       TextSpan(text: '$butter  ', style: GoogleFonts.notoColorEmoji()),
      //     ]
      //   )
      // ),
      leading: GetImage(widget.meal.reference.photo),
      title: Text(widget.meal.name),
      expandedCrossAxisAlignment: CrossAxisAlignment.center,
      onExpansionChanged: (newExpState){
        setState(() {
          _isExpanded = newExpState;
        });
      },
      controller: widget.expansionController,
      // childrenPadding: const EdgeInsets.fromLTRB(40, 0, 0, 5),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 2),
          child: MealStyleNutrientDisplay(widget.meal.nutrients),
        ),
        const Text(
          'Serving Size',
          style: TextStyle(fontSize: 16),
        ),
        TextFormField(
          // initialValue: widget.meal.grams.isInt
          //     ? widget.meal.grams.toInt().toString()
          //     : roundDecimal(widget.meal.grams.toDouble(), 3).toString(),
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            border: InputBorder.none,
            // label: Center(child: Text('grams')),
            // alignLabelWithHint: true,
            // hintText: 'grams',
          ),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
          ],
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          controller: widget.textController,
          validator: (val) => val == null || val.isEmpty || val == '.' ? 'Required Field' : null,
          onChanged: (valString){
            final val = fixDecimal(valString);
            if (val == null){return;}
              setState(() {
                widget.meal = widget.meal.reference.toMealComponent(
                    widget.servingValue, val, widget.meal.reference
                );
                print(widget.meal.nutrients);
              });
           // TODO: Update Bloc
          },
        ),
        DropdownButton<String>(
            value: widget.servingValue,
            items: widget.meal.reference.altMeasures2grams.keys
                .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (String? newAltMeasure) {
              if (newAltMeasure == null){return;}
                setState(() {
                  final ratio = widget.meal.grams / _getAltMeasure(newAltMeasure);
                  widget.textController.text = ratio.isInt ? ratio.toInt().toString() : roundDecimal(ratio.toDouble(), 3).toString();
                  widget.servingValue = newAltMeasure;
                });
            })
      ],
    );
  }
}


AlertDialog mealNotesPopUp(Meal meal, BuildContext context) =>
    AlertDialog(
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
