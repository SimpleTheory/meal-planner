import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrition_app/screens/custom_ingredient.dart';
import 'package:nutrition_app/utils/local_widgets.dart';
import 'package:nutrition_app/utils/utils.dart';
import 'package:nutrition_app/domain.dart';

import '../temp_dummy_data.dart';
// import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';


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
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                      contentPadding: EdgeInsets.all(20),
                      suffixIcon: const Icon(Icons.search)
                  )
              )
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: ListView(
                children: [
                  plusSignTile(() {openAddNewIngredientPopUp(context);}),
                  ...ingredients.map((e) => ingredientTile(e)),
                  // ...ingredients.map((e) => ingredientTile(e)),
                  // ...ingredients.map((e) => ingredientTile(e)),
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


class IngredientPopUpEnumHolder{
  const IngredientPopUpEnumHolder(Ingredient ingredient, PopUpOptions option);
}

ListTile ingredientTile(Ingredient ingredient){
  // TODO CREATE WAY TO RENDER CUSTOM EMOJIS WITH BRANDON FONT
  // print(Ingredient.photo);
  return ListTile(
    title: Text(ingredient.name),
    trailing: PopupMenuButton(
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(value: IngredientPopUpEnumHolder(ingredient, PopUpOptions.edit),child: const Text('Edit'),),
        PopupMenuItem(value: IngredientPopUpEnumHolder(ingredient, PopUpOptions.delete), child: const Text('Delete')),
        PopupMenuItem(value: IngredientPopUpEnumHolder(ingredient, PopUpOptions.duplicate),child: const Text('Duplicate'),),
      ],
    ),
    subtitle: Text(
        'Serving (${ingredient.baseNutrient.grams}g):  '
            "${ingredient.baseNutrient.nutrients.calories.value.round()}\u{1F525}  "
            '${ingredient.baseNutrient.nutrients.carbohydrate.value.round()}\u{1F35E}   '
            '${ingredient.baseNutrient.nutrients.protein.value.round()}\u{1F969}   '
        // '${Ingredient.baseNutrient.nutrients.unsaturatedFat.value.round()}\u{1FAD2}  '
            '${ingredient.baseNutrient.nutrients.unsaturatedFat.value.round()}$olive   '
        // '${Ingredient.baseNutrient.nutrients.saturatedFat.value.round()}\u{1F9C8}',
            '${ingredient.baseNutrient.nutrients.saturatedFat.value.round()}$butter'
    ),
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
    leading: getImage(ingredient.photo),
    onTap: (){},
  );
}

openAddNewIngredientPopUp(BuildContext context)=>
    showDialog(context: context,
        builder: (context)=>AlertDialog(
          title: const Text('Add New Ingredient'),
          content: Column(
            children: [
              const Text('Input UPC or name of desired ingredient:'),
              TextField(
                  decoration: const InputDecoration(
                    labelText: 'UPC or Name',
                  ),
                  autofocus: true,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp('[A-Za-z0-9 ]+'))
                  ]
              ),
              const Text('Or:'),
              ElevatedButton(
                  onPressed: (){},// async {
                  //   var res = await Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const SimpleBarcodeScannerPage(),
                  //     )
                  //   );
                  //   if (res is String) {
                  //     res = int.parse(res);
                  //     print(res);
                  //   // ADD BLOC EVENT HERE
                  //     }
                  // },
                  child: const Text('Scan UPC')),
              ElevatedButton(
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomIngredientPage()));},
                  child: const Text('Create Custom Ingredient')),
            ],
          ).pad(const EdgeInsets.all(8)),
          actions: [
            TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Submit'))
          ],
        )
    );

Widget confirmIngredient(Ingredient ingredient, BuildContext context) =>
    AlertDialog(
      title: const Text('Confirm Ingredient'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: getImage(ingredient.photo, width: 200, height: 200)),
            Center(child: Text(ingredient.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)),
            Text(
                'Serving (${ingredient.baseNutrient.grams}g):  '
                    "${ingredient.baseNutrient.nutrients.calories.value.round()}\u{1F525}  "
                    '${ingredient.baseNutrient.nutrients.carbohydrate.value.round()}\u{1F35E}   '
                    '${ingredient.baseNutrient.nutrients.protein.value.round()}\u{1F969}   '
                // '${Ingredient.baseNutrient.nutrients.unsaturatedFat.value.round()}\u{1FAD2}  '
                    '${ingredient.baseNutrient.nutrients.unsaturatedFat.value.round()}$olive   '
                // '${Ingredient.baseNutrient.nutrients.saturatedFat.value.round()}\u{1F9C8}',
                    '${ingredient.baseNutrient.nutrients.saturatedFat.value.round()}$butter'
            ),
            Text('Source: ${ingredient.sourceMetadata}', style: const TextStyle(fontSize: 12),),
            const Text('Is this the ingredient you were looking for?', style: TextStyle(fontSize: 16),)
          ],
        ).pad(const EdgeInsets.all(12)),
      ),
      actions: [
        Row(
          children: [
            ElevatedButton(onPressed: (){Navigator.pop(context);}, child: const Text('No')),
            const Spacer(),
            ElevatedButton(onPressed: (){}, child: const Text('Yes'))
          ],
        )
      ],
      actionsPadding: const EdgeInsets.fromLTRB(40, 10, 40, 30),
    );
