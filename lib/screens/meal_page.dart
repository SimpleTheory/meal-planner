import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/blocs/ingredients_page/ingredients_page_bloc.dart';
import 'package:nutrition_app/blocs/meal_maker/meal_maker_bloc.dart';
import 'package:nutrition_app/screens/ingredients_page.dart';
import 'package:nutrition_app/utils/local_widgets.dart';
import 'package:nutrition_app/utils/utils.dart';
import 'package:nutrition_app/domain.dart';
import 'meal_maker_page.dart';


class MealPage extends StatelessWidget {
  const MealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ingPgBloc = context.read<IngredientsPageBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
        actions: [BlocBuilder<IngredientsPageBloc, IngredientsPageState>(
          builder: (context, state) {
            return Switch(
                value: state.includeSubRecipes,
                onChanged: (toggle) {
                  ingPgBloc.add(IngPageIncludeSubRecipes(toggle));
                });
          },
        )
        ],
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(5, 8, 5, 2.5),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    contentPadding: const EdgeInsets.all(20),
                    suffixIcon: const Icon(Icons.search)
                ),
                onChanged: (val) {
                  ingPgBloc.add(UpdateSearchIng(val));
                },
              )
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: ListView(
                children: [
                  PlusSignTile((_) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MultiBlocProvider(
                                  providers: [
                                    BlocProvider(create: (context) => MealMakerBloc()),
                                    BlocProvider.value(value: ingPgBloc)
                                  ],
                                  child: const MealMakerPage(),
                                )
                        )
                    );
                  }),
                  BlocBuilder<IngredientsPageBloc, IngredientsPageState>(
                    builder: (context, state) {
                      return ListView.builder(
                        itemBuilder: (context, index) =>
                            IngredientTile(state.searchResults[index]),
                        itemCount: state.searchResults.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MealPopUpEnumHolder {
  const MealPopUpEnumHolder(Meal meal, PopUpOptions option);
}

// ListTile mealTile(Meal meal){
//   // TODO CREATE WAY TO RENDER CUSTOM EMOJIS WITH BRANDON FONT
//   // print(meal.photo);
//   return ListTile(
//     title: Text(meal.name),
//     trailing: PopupMenuButton(
//       itemBuilder: (BuildContext context) => [
//       PopupMenuItem(value: MealPopUpEnumHolder(meal, PopUpOptions.edit),child: const Text('Edit'),),
//       PopupMenuItem(value: MealPopUpEnumHolder(meal, PopUpOptions.delete), child: const Text('Delete')),
//       PopupMenuItem(value: MealPopUpEnumHolder(meal, PopUpOptions.duplicate),child: const Text('Duplicate'),),
//       ],
//     ),
//     subtitle: Text(
//             'Serving:  '
//             "${meal.baseNutrient.nutrients.calories.value.round()}\u{1F525}  "
//             '${meal.baseNutrient.nutrients.carbohydrate.value.round()}\u{1F35E}  '
//             '${meal.baseNutrient.nutrients.protein.value.round()}\u{1F969}  '
//             // '${meal.baseNutrient.nutrients.unsaturatedFat.value.round()}\u{1FAD2}  '
//             '${meal.baseNutrient.nutrients.unsaturatedFat.value.round()}$olive  '
//             // '${meal.baseNutrient.nutrients.saturatedFat.value.round()}\u{1F9C8}',
//             '${meal.baseNutrient.nutrients.saturatedFat.value.round()}$butter'
//     ),
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
//     leading: GetImage(meal.photo),
//     onTap: (){},
//   );
// }

class MealTile extends StatelessWidget {
  final Meal meal;

  const MealTile(this.meal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(meal.name),
      trailing: PopupMenuButton(
        itemBuilder: (BuildContext context) =>
        [
          PopupMenuItem(
            value: MealPopUpEnumHolder(meal, PopUpOptions.edit),
            child: const Text('Edit'),
          ),
          PopupMenuItem(
              value: MealPopUpEnumHolder(meal, PopUpOptions.delete),
              child: const Text('Delete')),
          PopupMenuItem(
            value: MealPopUpEnumHolder(meal, PopUpOptions.duplicate),
            child: const Text('Duplicate'),
          ),
        ],
      ),
      // subtitle: Text(
      //     'Serving:  '
      //         "${meal.baseNutrient.nutrients.calories.value.round()}\u{1F525}  "
      //         '${meal.baseNutrient.nutrients.carbohydrate.value.round()}\u{1F35E}  '
      //         '${meal.baseNutrient.nutrients.protein.value.round()}\u{1F969}  '
      //     // '${meal.baseNutrient.nutrients.unsaturatedFat.value.round()}\u{1FAD2}  '
      //         '${meal.baseNutrient.nutrients.unsaturatedFat.value.round()}$olive  '
      //     // '${meal.baseNutrient.nutrients.saturatedFat.value.round()}\u{1F9C8}',
      //         '${meal.baseNutrient.nutrients.saturatedFat.value.round()}$butter'
      // ),
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
      subtitle: NutrientText(nutrients: meal.baseNutrient.nutrients),
      leading: GetImage(meal.photo),
      onTap: () {},
    );
  }
}

/// Things not working
/// Meal's nutrient not updating
/// MCTile is totally refreshed after build
