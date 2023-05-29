import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/blocs/custom_ing/custom_ing_bloc.dart';
import 'package:nutrition_app/screens/barcode_scan.dart';
import 'package:nutrition_app/screens/custom_ingredient.dart';
import 'package:nutrition_app/utils/local_widgets.dart';
import 'package:nutrition_app/utils/utils.dart';
import 'package:nutrition_app/domain.dart';
import '../blocs/ingredients_page/ingredients_page_bloc.dart';

class IngredientPage extends StatelessWidget {
  IngredientPage({Key? key}) : super(key: key);
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingredients'),
        actions: [
          const Center(child: Text('Include Sub-Recipes')),
          BlocBuilder<IngredientsPageBloc, IngredientsPageState>(
              builder: (context, state) => Switch(
                    onChanged: (toggle) => context
                        .read<IngredientsPageBloc>()
                        .add(IngPageIncludeSubRecipes(toggle)),
                    value: state.includeSubRecipes,
                  ))
        ],
      ),
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
                  controller: searchController,
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
                  BlocConsumer<IngredientsPageBloc, IngredientsPageState>(
                    listener: (context, state){
                      if (state.backReference && state is IngPageSuccessfulCreation){
                        Navigator.pop(context, state.ingredient);
                      }
                    },
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
  final MealComponentFactory ingredient;
  final PopUpOptions option;

  const IngredientPopUpEnumHolder(this.ingredient, this.option);
}

class IngredientTile extends StatelessWidget {
  final MealComponentFactory ingredient;

  const IngredientTile(this.ingredient, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ingPgBloc = context.read<IngredientsPageBloc>();
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
        onSelected: (IngredientPopUpEnumHolder ing) {
          switch (ing.option) {
            case PopUpOptions.edit:
              if (ing.ingredient is Ingredient) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MultiBlocProvider(providers: [
                              BlocProvider(
                                  create: (context) => CustomIngBloc(
                                      ing.ingredient as Ingredient)),
                              BlocProvider.value(
                                  value: ingPgBloc)
                            ], child: const CustomIngredientPage())));
              }
              break;
            case PopUpOptions.delete:
              ingPgBloc.add(IngDelete(ingredient));
              break;
            case PopUpOptions.duplicate:
              ingPgBloc.add(IngDuplicate(ingredient));
              break;
          }
        },
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
      onTap: () {
        if (ingPgBloc.state.backReference){
          Navigator.pop(context, ingredient);
        }
        //else if (){}
        else{
          if (ingredient is Ingredient){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MultiBlocProvider(providers: [
                      BlocProvider(
                          create: (context) => CustomIngBloc(
                              ingredient as Ingredient)),
                      BlocProvider.value(
                          value: ingPgBloc)
                    ], child: const CustomIngredientPage())));
          }
        }
      },
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
  final ingPgBloc = context.read<IngredientsPageBloc>();
  showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
            value: ingPgBloc,
            child: ScaffoldMessenger(
              child: Builder(
                builder: (context) => Scaffold(
                  body: AlertDialog(
                    title: const Text('Add New Ingredient'),
                    content:
                        BlocListener<IngredientsPageBloc, IngredientsPageState>(
                      listener: (context, state) {
                        if (state is IngPageApiError) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(state.message),
                            backgroundColor: Colors.red,
                          ));
                        }
                      },
                      child: SingleChildScrollView(
                        child: PaddedColumn(
                          edgeInsets: const EdgeInsets.all(2),
                          children: [
                            const Text(
                                'Input UPC or name of desired ingredient:'),
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
                                              BlocProvider.value(
                                                value: ingPgBloc,
                                                child:
                                                    const BarcodeReadingPage(),
                                              )));
                                },
                                child: const Text('Scan UPC')),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MultiBlocProvider(
                                                  providers: [
                                                    BlocProvider(
                                                        create: (context) =>
                                                            CustomIngBloc()),
                                                    BlocProvider.value(
                                                        value: ingPgBloc)
                                                  ],
                                                  child:
                                                      const CustomIngredientPage())));
                                },
                                child: const Text('Create Custom Ingredient')),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel')),
                          const Spacer(),
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
                                              builder: (_) =>
                                                  BlocProvider.value(
                                                    value: context.read<
                                                        IngredientsPageBloc>(),
                                                    child: confirmIngredient(
                                                        value, context),
                                                  )), onError: (err) {
                                    ingPgBloc.add(
                                        IngPageAPIErrorEvent(err.toString()));
                                  });
                                } else {
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text('Submit')),
                        ],
                      )
                    ],
                  ),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ));
}

AlertDialog confirmIngredient(Ingredient ingredient, BuildContext context,
        [IngredientsPageBloc? ingPgBloc]) =>
    AlertDialog(
      title: const Text('Confirm Ingredient'),
      content: SingleChildScrollView(
        child: PaddedColumn(
          edgeInsets: const EdgeInsets.all(12),
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
        ),
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
                  // TODO Retrofit to back-references
                  Navigator.of(context)
                      .popUntil(ModalRoute.withName('/IngredientsPage'));
                  (ingPgBloc ?? context.read<IngredientsPageBloc>())
                      .add(OnSubmitSolo(ingredient));
                },
                child: const Text('Yes'))
          ],
        )
      ],
      actionsPadding: const EdgeInsets.fromLTRB(40, 10, 40, 30),
    );
