import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrition_app/screens/custom_ingredient.dart';
import 'package:nutrition_app/utils/local_widgets.dart';
import 'package:nutrition_app/utils/utils.dart';
import 'package:nutrition_app/domain.dart';
// import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

final ingredients = [
  Ingredient.fromJson(
      '{"__type":"Ingredient","name":"milk","baseNutrient":{"__type":"BaseNutrients","grams":244,"nutrients":{"__type":"Nutrients","calcium":{"__type":"Nutrient","value":292.8,"unit":"mg","name":"Calcium"},"carbohydrate":{"__type":"Nutrient","value":11.712,"unit":"g","name":"Carbohydrate"},"cholesterol":{"__type":"Nutrient","value":19.52,"unit":"mg","name":"Cholesterol"},"calories":{"__type":"Nutrient","value":122,"unit":"kcal","name":"Calories"},"saturatedFat":{"__type":"Nutrient","value":3.0671,"unit":"g","name":"SaturatedFat"},"totalFat":{"__type":"Nutrient","value":4.8312,"unit":"g","name":"TotalFat"},"transFat":{"__type":"Nutrient","value":0.2074,"unit":"g","name":"TransFat"},"iron":{"__type":"Nutrient","value":0.0488,"unit":"mg","name":"Iron"},"fiber":{"__type":"Nutrient","value":0,"unit":"g","name":"Fiber"},"potassium":{"__type":"Nutrient","value":341.6,"unit":"mg","name":"Potassium"},"sodium":{"__type":"Nutrient","value":114.68,"unit":"mg","name":"Sodium"},"protein":{"__type":"Nutrient","value":8.052,"unit":"g","name":"Protein"},"sugars":{"__type":"Nutrient","value":12.3464,"unit":"g","name":"Sugars"},"choline":{"__type":"Nutrient","value":40.016,"unit":"mg","name":"Choline"},"copper":{"__type":"Nutrient","value":0.0146,"unit":"mg","name":"Copper"},"ala":{"__type":"Nutrient","value":0.0195,"unit":"g","name":"ALA"},"linoleicAcid":{"__type":"Nutrient","value":0,"unit":"g","name":"LinoleicAcid"},"epa":{"__type":"Nutrient","value":0,"unit":"g","name":"EPA"},"dpa":{"__type":"Nutrient","value":0,"unit":"g","name":"DPA"},"dha":{"__type":"Nutrient","value":0,"unit":"g","name":"DHA"},"folate":{"__type":"Nutrient","value":12.2,"unit":"µg","name":"Folate"},"magnesium":{"__type":"Nutrient","value":26.84,"unit":"mg","name":"Magnesium"},"manganese":{"__type":"Nutrient","value":0.0342,"unit":"mg","name":"Manganese"},"niacin":{"__type":"Nutrient","value":0.2245,"unit":"mg","name":"Niacin"},"phosphorus":{"__type":"Nutrient","value":224.48,"unit":"mg","name":"Phosphorus"},"pantothenicAcid":{"__type":"Nutrient","value":0.8686,"unit":"mg","name":"PantothenicAcid"},"riboflavin":{"__type":"Nutrient","value":0.4514,"unit":"mg","name":"Riboflavin"},"selenium":{"__type":"Nutrient","value":6.1,"unit":"µg","name":"Selenium"},"thiamin":{"__type":"Nutrient","value":0.0952,"unit":"mg","name":"Thiamin"},"vitaminE":{"__type":"Nutrient","value":0.0732,"unit":"mg","name":"VitaminE"},"vitaminA":{"__type":"Nutrient","value":134.2,"unit":"µg","name":"VitaminA"},"vitaminB12":{"__type":"Nutrient","value":1.2932,"unit":"µg","name":"VitaminB12"},"vitaminB6":{"__type":"Nutrient","value":0.0927,"unit":"mg","name":"VitaminB6"},"vitaminC":{"__type":"Nutrient","value":0.488,"unit":"mg","name":"VitaminC"},"vitaminD":{"__type":"Nutrient","value":2.928,"unit":"µg","name":"VitaminD"},"vitaminK":{"__type":"Nutrient","value":0.488,"unit":"µg","name":"VitaminK"},"zinc":{"__type":"Nutrient","value":1.1712,"unit":"mg","name":"Zinc"},"unsaturatedFat":{"__type":"Nutrient","value":1.7641,"unit":"g","name":"UnstauratedFat"}}},"altMeasures2grams":{"cup":244,"fl oz":30.5,"quart":976,"g":100,"tsp":5.08,"tbsp":15.25,"grams":1},"photo":{"__type":"Uri","url":"https://nix-tag-images.s3.amazonaws.com/377_highres.jpg"},"source":{"__type":"IngredientSource","__enum":true,"value":"IngredientSource.string"},"sourceMetadata":"milk"}'
  ),
  Ingredient.fromJson(
      '{"__type":"Ingredient","name":"No Sugar Keto Cup, Dark Chocolate","baseNutrient":{"__type":"BaseNutrients","grams":17,"nutrients":{"__type":"Nutrients","calcium":{"__type":"Nutrient","value":10,"unit":"mg","name":"Calcium"},"carbohydrate":{"__type":"Nutrient","value":9,"unit":"g","name":"Carbohydrate"},"cholesterol":{"__type":"Nutrient","value":0,"unit":"mg","name":"Cholesterol"},"calories":{"__type":"Nutrient","value":70,"unit":"kcal","name":"Calories"},"saturatedFat":{"__type":"Nutrient","value":4.5,"unit":"g","name":"SaturatedFat"},"totalFat":{"__type":"Nutrient","value":7,"unit":"g","name":"TotalFat"},"transFat":{"__type":"Nutrient","value":0,"unit":"g","name":"TransFat"},"iron":{"__type":"Nutrient","value":1.3,"unit":"mg","name":"Iron"},"fiber":{"__type":"Nutrient","value":4,"unit":"g","name":"Fiber"},"potassium":{"__type":"Nutrient","value":35,"unit":"mg","name":"Potassium"},"sodium":{"__type":"Nutrient","value":0,"unit":"mg","name":"Sodium"},"protein":{"__type":"Nutrient","value":1,"unit":"g","name":"Protein"},"sugars":{"__type":"Nutrient","value":0,"unit":"g","name":"Sugars"},"choline":{"__type":"Nutrient","value":0,"unit":"mg","name":"Choline"},"copper":{"__type":"Nutrient","value":0,"unit":"mg","name":"Copper"},"ala":{"__type":"Nutrient","value":0,"unit":"g","name":"ALA"},"linoleicAcid":{"__type":"Nutrient","value":0,"unit":"g","name":"LinoleicAcid"},"epa":{"__type":"Nutrient","value":0,"unit":"g","name":"EPA"},"dpa":{"__type":"Nutrient","value":0,"unit":"g","name":"DPA"},"dha":{"__type":"Nutrient","value":0,"unit":"g","name":"DHA"},"folate":{"__type":"Nutrient","value":0,"unit":"µg","name":"Folate"},"magnesium":{"__type":"Nutrient","value":0,"unit":"mg","name":"Magnesium"},"manganese":{"__type":"Nutrient","value":0,"unit":"mg","name":"Manganese"},"niacin":{"__type":"Nutrient","value":0,"unit":"mg","name":"Niacin"},"phosphorus":{"__type":"Nutrient","value":0,"unit":"mg","name":"Phosphorus"},"pantothenicAcid":{"__type":"Nutrient","value":0,"unit":"mg","name":"PantothenicAcid"},"riboflavin":{"__type":"Nutrient","value":0,"unit":"mg","name":"Riboflavin"},"selenium":{"__type":"Nutrient","value":0,"unit":"µg","name":"Selenium"},"thiamin":{"__type":"Nutrient","value":0,"unit":"mg","name":"Thiamin"},"vitaminE":{"__type":"Nutrient","value":0,"unit":"mg","name":"VitaminE"},"vitaminA":{"__type":"Nutrient","value":0,"unit":"µg","name":"VitaminA"},"vitaminB12":{"__type":"Nutrient","value":0,"unit":"µg","name":"VitaminB12"},"vitaminB6":{"__type":"Nutrient","value":0,"unit":"mg","name":"VitaminB6"},"vitaminC":{"__type":"Nutrient","value":0,"unit":"mg","name":"VitaminC"},"vitaminD":{"__type":"Nutrient","value":0,"unit":"µg","name":"VitaminD"},"vitaminK":{"__type":"Nutrient","value":0,"unit":"µg","name":"VitaminK"},"zinc":{"__type":"Nutrient","value":0,"unit":"mg","name":"Zinc"},"unsaturatedFat":{"__type":"Nutrient","value":2.5,"unit":"g","name":"UnstauratedFat"}}},"altMeasures2grams":{"piece":17,"grams":1},"photo":{"__type":"Uri","url":"https://nutritionix-api.s3.amazonaws.com/5fb2849e5c1ca76c4b2019cb.jpeg"},"source":{"__type":"IngredientSource","__enum":true,"value":"IngredientSource.upc"},"sourceMetadata":687910000636}'
  ),
  Ingredient.fromJson(
      '{"__type":"Ingredient","name":"pizza","baseNutrient":{"__type":"BaseNutrients","grams":107,"nutrients":{"__type":"Nutrients","calcium":{"__type":"Nutrient","value":201.16,"unit":"mg","name":"Calcium"},"carbohydrate":{"__type":"Nutrient","value":35.6631,"unit":"g","name":"Carbohydrate"},"cholesterol":{"__type":"Nutrient","value":18.19,"unit":"mg","name":"Cholesterol"},"calories":{"__type":"Nutrient","value":284.62,"unit":"kcal","name":"Calories"},"saturatedFat":{"__type":"Nutrient","value":4.7776,"unit":"g","name":"SaturatedFat"},"totalFat":{"__type":"Nutrient","value":10.3683,"unit":"g","name":"TotalFat"},"transFat":{"__type":"Nutrient","value":0.2579,"unit":"g","name":"TransFat"},"iron":{"__type":"Nutrient","value":2.6536,"unit":"mg","name":"Iron"},"fiber":{"__type":"Nutrient","value":2.461,"unit":"g","name":"Fiber"},"potassium":{"__type":"Nutrient","value":184.04,"unit":"mg","name":"Potassium"},"sodium":{"__type":"Nutrient","value":639.86,"unit":"mg","name":"Sodium"},"protein":{"__type":"Nutrient","value":12.1873,"unit":"g","name":"Protein"},"sugars":{"__type":"Nutrient","value":3.8306,"unit":"g","name":"Sugars"},"choline":{"__type":"Nutrient","value":17.548,"unit":"mg","name":"Choline"},"copper":{"__type":"Nutrient","value":0.1124,"unit":"mg","name":"Copper"},"ala":{"__type":"Nutrient","value":0.1873,"unit":"g","name":"ALA"},"linoleicAcid":{"__type":"Nutrient","value":0.0032,"unit":"g","name":"LinoleicAcid"},"epa":{"__type":"Nutrient","value":0.0043,"unit":"g","name":"EPA"},"dpa":{"__type":"Nutrient","value":0.0043,"unit":"g","name":"DPA"},"dha":{"__type":"Nutrient","value":0,"unit":"g","name":"DHA"},"folate":{"__type":"Nutrient","value":99.51,"unit":"µg","name":"Folate"},"magnesium":{"__type":"Nutrient","value":25.68,"unit":"mg","name":"Magnesium"},"manganese":{"__type":"Nutrient","value":0.3852,"unit":"mg","name":"Manganese"},"niacin":{"__type":"Nutrient","value":4.0928,"unit":"mg","name":"Niacin"},"phosphorus":{"__type":"Nutrient","value":231.12,"unit":"mg","name":"Phosphorus"},"pantothenicAcid":{"__type":"Nutrient","value":0,"unit":"mg","name":"PantothenicAcid"},"riboflavin":{"__type":"Nutrient","value":0.2087,"unit":"mg","name":"Riboflavin"},"selenium":{"__type":"Nutrient","value":21.293,"unit":"µg","name":"Selenium"},"thiamin":{"__type":"Nutrient","value":0.4173,"unit":"mg","name":"Thiamin"},"vitaminE":{"__type":"Nutrient","value":0.8881,"unit":"mg","name":"VitaminE"},"vitaminA":{"__type":"Nutrient","value":73.83,"unit":"µg","name":"VitaminA"},"vitaminB12":{"__type":"Nutrient","value":0.4494,"unit":"µg","name":"VitaminB12"},"vitaminB6":{"__type":"Nutrient","value":0.0856,"unit":"mg","name":"VitaminB6"},"vitaminC":{"__type":"Nutrient","value":1.498,"unit":"mg","name":"VitaminC"},"vitaminD":{"__type":"Nutrient","value":0,"unit":"µg","name":"VitaminD"},"vitaminK":{"__type":"Nutrient","value":7.169,"unit":"µg","name":"VitaminK"},"zinc":{"__type":"Nutrient","value":1.4338,"unit":"mg","name":"Zinc"},"unsaturatedFat":{"__type":"Nutrient","value":5.5907,"unit":"g","name":"UnstauratedFat"}}},"altMeasures2grams":{"slice":107,"pizza":853,"large slice":170,"medium slice":80,"small slice":65,"large pizza":853,"medium pizza":640,"small pizza":390,"personal pan pizza":225,"personal pan pizza slice":56.25,"g":100,"wt. oz":28.3495,"grams":1},"photo":{"__type":"Uri","url":"https://nix-tag-images.s3.amazonaws.com/1060_highres.jpg"},"source":{"__type":"IngredientSource","__enum":true,"value":"IngredientSource.string"},"sourceMetadata":"pizza"}'
  )
];

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

enum PopUpOptions{
  edit, delete, duplicate
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
        'Serving:  '
            "${ingredient.baseNutrient.nutrients.calories.value.round()}\u{1F525}  "
            '${ingredient.baseNutrient.nutrients.carbohydrate.value.round()}\u{1F35E}  '
            '${ingredient.baseNutrient.nutrients.protein.value.round()}\u{1F969}  '
        // '${Ingredient.baseNutrient.nutrients.unsaturatedFat.value.round()}\u{1FAD2}  '
            '${ingredient.baseNutrient.nutrients.unsaturatedFat.value.round()}$olive  '
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
          actions: [TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Submit'))],
        )
    );
