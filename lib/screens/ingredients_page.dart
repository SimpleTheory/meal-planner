import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/screens/barcode_scan.dart';
import 'package:nutrition_app/screens/custom_ingredient.dart';
import 'package:nutrition_app/utils/local_widgets.dart';
import 'package:nutrition_app/utils/utils.dart';
import 'package:nutrition_app/domain.dart';
import '../blocs/ingredients_page/ingredients_page_bloc.dart';

class IngredientPage extends StatelessWidget {
  const IngredientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ingredients')),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(5, 8, 5, 2.5),
              child: TextField(
                  onChanged: (val) {
                    context
                        .read<IngredientsPageBloc>()
                        .add(UpdateSearchIng(val));
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      contentPadding: const EdgeInsets.all(20),
                      suffixIcon: const Icon(Icons.search)))),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: ListView(
                children: [
                  PlusSignTile((context) {
                    openAddNewIngredientPopUp(context);
                  }),
                  BlocBuilder<IngredientsPageBloc, IngredientsPageState>(
                    builder: (context, state) {
                      // Maybe add something for if its empty
                      return ListView.builder(
                        itemBuilder: (context, index) =>
                            IngredientTile(state.searchResults[index]),
                        itemCount: state.searchResults.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                      );
                    },
                  )
                  // ...ingredients.map((e) => ingredientTile(e)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class IngredientPopUpEnumHolder {
  const IngredientPopUpEnumHolder(
      MealComponentFactory ingredient, PopUpOptions option);
}

class IngredientTile extends StatelessWidget {
  final MealComponentFactory ingredient;

  const IngredientTile(this.ingredient, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(ingredient.name),
      trailing: PopupMenuButton(
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(
            value: IngredientPopUpEnumHolder(ingredient, PopUpOptions.edit),
            child: const Text('Edit'),
          ),
          PopupMenuItem(
              value: IngredientPopUpEnumHolder(ingredient, PopUpOptions.delete),
              child: const Text('Delete')),
          PopupMenuItem(
            value:
                IngredientPopUpEnumHolder(ingredient, PopUpOptions.duplicate),
            child: const Text('Duplicate'),
          ),
        ],
      ),
      subtitle: NutrientText(
        nutrients: ingredient.baseNutrient.nutrients,
        grams: ingredient.baseNutrient.grams,
      ),
      // subtitle: Text(
      //     'Serving (${ingredient.baseNutrient.grams}g):  '
      //         "${ingredient.baseNutrient.nutrients.calories.value.round()}\u{1F525}  "
      //         '${ingredient.baseNutrient.nutrients.carbohydrate.value.round()}\u{1F35E}   '
      //         '${ingredient.baseNutrient.nutrients.protein.value.round()}\u{1F969}   '
      //     // '${Ingredient.baseNutrient.nutrients.unsaturatedFat.value.round()}\u{1FAD2}  '
      //         '${ingredient.baseNutrient.nutrients.unsaturatedFat.value.round()}$olive   '
      //     // '${Ingredient.baseNutrient.nutrients.saturatedFat.value.round()}\u{1F9C8}',
      //         '${ingredient.baseNutrient.nutrients.saturatedFat.value.round()}$butter'
      // ),
      // subtitle: RichText(
      //   text: TextSpan(
      //     children:[
      //       TextSpan(text: 'Serving:  '),
      //       TextSpan(text: "${Ingredient.baseNutrient.nutrients.calories.value.round()}\u{1F525}  "),
      //       TextSpan(text: '\u{1F525}  ', style: TextStyle(fontFamily: 'EmojiOne')),
      //       TextSpan(text: '${Ingredient.baseNutrient.nutrients.carbohydrate.value.round()}\u{1F35E}  '),
      //       TextSpan(text: '\u{1F35E}  ', style: TextStyle(fontFamily: 'EmojiOne')),
      //       TextSpan(text: '${Ingredient.baseNutrient.nutrients.protein.value.round()}\u{1F969}  '),
      //       TextSpan(text: '\u{1F969}  ', style: TextStyle(fontFamily: 'EmojiOne')),
      //       // '${Ingredient.baseNutrient.nutrients.unsaturatedFat.value.round()}\u{1FAD2}  '
      //       TextSpan(text: '${Ingredient.baseNutrient.nutrients.unsaturatedFat.value.round()}$olive  '),
      //       TextSpan(text: '$olive  ', style: GoogleFonts.notoColorEmoji()),
      //       // '${Ingredient.baseNutrient.nutrients.saturatedFat.value.round()}\u{1F9C8}',
      //       TextSpan(text: '${Ingredient.baseNutrient.nutrients.saturatedFat.value.round()}$butter'),
      //       TextSpan(text: '$butter  ', style: GoogleFonts.notoColorEmoji()),
      //     ]
      //   )
      // ),
      leading: GetImage(ingredient.photo),
      onTap: () {},
    );
  }
}

// ListTile ingredientTile(Ingredient ingredient){
//   // TODO CREATE WAY TO RENDER CUSTOM EMOJIS WITH BRANDON FONT
//   // print(Ingredient.photo);
//   return ListTile(
//     title: Text(ingredient.name),
//     trailing: PopupMenuButton(
//       itemBuilder: (BuildContext context) => [
//         PopupMenuItem(value: IngredientPopUpEnumHolder(ingredient, PopUpOptions.edit),child: const Text('Edit'),),
//         PopupMenuItem(value: IngredientPopUpEnumHolder(ingredient, PopUpOptions.delete), child: const Text('Delete')),
//         PopupMenuItem(value: IngredientPopUpEnumHolder(ingredient, PopUpOptions.duplicate),child: const Text('Duplicate'),),
//       ],
//     ),
//     subtitle: Text(
//         'Serving (${ingredient.baseNutrient.grams}g):  '
//             "${ingredient.baseNutrient.nutrients.calories.value.round()}\u{1F525}  "
//             '${ingredient.baseNutrient.nutrients.carbohydrate.value.round()}\u{1F35E}   '
//             '${ingredient.baseNutrient.nutrients.protein.value.round()}\u{1F969}   '
//         // '${Ingredient.baseNutrient.nutrients.unsaturatedFat.value.round()}\u{1FAD2}  '
//             '${ingredient.baseNutrient.nutrients.unsaturatedFat.value.round()}$olive   '
//         // '${Ingredient.baseNutrient.nutrients.saturatedFat.value.round()}\u{1F9C8}',
//             '${ingredient.baseNutrient.nutrients.saturatedFat.value.round()}$butter'
//     ),
//     // subtitle: RichText(
//     //   text: TextSpan(
//     //     children:[
//     //       TextSpan(text: 'Serving:  '),
//     //       TextSpan(text: "${Ingredient.baseNutrient.nutrients.calories.value.round()}\u{1F525}  "),
//     //       TextSpan(text: '\u{1F525}  ', style: TextStyle(fontFamily: 'EmojiOne')),
//     //       TextSpan(text: '${Ingredient.baseNutrient.nutrients.carbohydrate.value.round()}\u{1F35E}  '),
//     //       TextSpan(text: '\u{1F35E}  ', style: TextStyle(fontFamily: 'EmojiOne')),
//     //       TextSpan(text: '${Ingredient.baseNutrient.nutrients.protein.value.round()}\u{1F969}  '),
//     //       TextSpan(text: '\u{1F969}  ', style: TextStyle(fontFamily: 'EmojiOne')),
//     //       // '${Ingredient.baseNutrient.nutrients.unsaturatedFat.value.round()}\u{1FAD2}  '
//     //       TextSpan(text: '${Ingredient.baseNutrient.nutrients.unsaturatedFat.value.round()}$olive  '),
//     //       TextSpan(text: '$olive  ', style: GoogleFonts.notoColorEmoji()),
//     //       // '${Ingredient.baseNutrient.nutrients.saturatedFat.value.round()}\u{1F9C8}',
//     //       TextSpan(text: '${Ingredient.baseNutrient.nutrients.saturatedFat.value.round()}$butter'),
//     //       TextSpan(text: '$butter  ', style: GoogleFonts.notoColorEmoji()),
//     //     ]
//     //   )
//     // ),
//     leading: GetImage(ingredient.photo),
//     onTap: (){},
//   );
// }

void openAddNewIngredientPopUp(BuildContext context) {
  final myController = TextEditingController();
  showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
            value: context.read<IngredientsPageBloc>(),
            child: ScaffoldMessenger(
              child: Builder(
                builder: (context) => Scaffold(
                  body: AlertDialog(
                    title: const Text('Add New Ingredient'),
                    content: BlocListener<IngredientsPageBloc, IngredientsPageState>(
                        listener: (context, state) {
                          if (state is IngPageApiError) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(state.message),
                              backgroundColor: Colors.red,
                            ));
                          }
                        },
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const Text('Input UPC or name of desired ingredient:'),
                              TextField(
                                decoration: const InputDecoration(
                                  labelText: 'UPC or Name',
                                ),
                                // autofocus: true,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[A-Za-z0-9 ]+'))
                                ],
                                controller: myController,
                              ),
                              const Text('Or:'),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const BarcodeReadingPage()));
                                  },
                                  child: const Text('Scan UPC')),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CustomIngredientPage()));
                                  },
                                  child: const Text('Create Custom Ingredient')),
                            ],
                          ).pad(const EdgeInsets.all(2)),
                        ),
                      ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            if (myController.text.isNotEmpty) {
                              Ingredient.fromApi(
                                      context
                                          .read<IngredientsPageBloc>()
                                          .state
                                          .app
                                          .settings,
                                      myController.text)
                                  .then(
                                      (value) => showDialog(
                                          context: context,
                                          builder: (context) =>
                                              confirmIngredient(value, context)),
                                      onError: (err) {
                                context.read<IngredientsPageBloc>().add(
                                    IngPageAPIErrorEvent(err.toString()));
                              });
                            } else {
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Submit'))
                    ],
                  ),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ));
}

AlertDialog confirmIngredient(Ingredient ingredient, BuildContext context) =>
    AlertDialog(
      title: const Text('Confirm Ingredient'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: GetImage(ingredient.photo, width: 200, height: 200)),
            Center(
                child: Text(
              ingredient.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )),
            NutrientText(
                nutrients: ingredient.baseNutrient.nutrients,
                grams: ingredient.baseNutrient.grams),
            // Text(
            //     'Serving (${ingredient.baseNutrient.grams}g):  '
            //         "${ingredient.baseNutrient.nutrients.calories.value.round()}\u{1F525}  "
            //         '${ingredient.baseNutrient.nutrients.carbohydrate.value.round()}\u{1F35E}   '
            //         '${ingredient.baseNutrient.nutrients.protein.value.round()}\u{1F969}   '
            //     // '${Ingredient.baseNutrient.nutrients.unsaturatedFat.value.round()}\u{1FAD2}  '
            //         '${ingredient.baseNutrient.nutrients.unsaturatedFat.value.round()}$olive   '
            //     // '${Ingredient.baseNutrient.nutrients.saturatedFat.value.round()}\u{1F9C8}',
            //         '${ingredient.baseNutrient.nutrients.saturatedFat.value.round()}$butter'
            // ),
            Text(
              'Source: ${ingredient.sourceMetadata}',
              style: const TextStyle(fontSize: 12),
            ),
            const Text(
              'Is this the ingredient you were looking for?',
              style: TextStyle(fontSize: 16),
            )
          ],
        ).pad(const EdgeInsets.all(12)),
      ),
      actions: [
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No')),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  // TODO: Add Bloc Functionality of adding Ingredient to App
                  context
                      .read<IngredientsPageBloc>()
                      .add(OnSubmitSolo(ingredient));
                  Navigator.of(context)
                      .popUntil(ModalRoute.withName('/IngredientsPage'));
                },
                child: const Text('Yes'))
          ],
        )
      ],
      actionsPadding: const EdgeInsets.fromLTRB(40, 10, 40, 30),
    );
