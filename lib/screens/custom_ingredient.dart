import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/utils/local_widgets.dart';
import 'package:nutrition_app/utils/utils.dart';

// TODO: Modify CustomIngredientPage to also be Ingredient Details Page

class CustomIngredientPage extends StatelessWidget {
  const CustomIngredientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ingredient: NAME')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: GestureDetector(
                  onTap: (){},
                  child: Image.asset('cache/images/null.png', width: 200, height: 200,)
              ),
            ),
            Row(
              children: [
                const Text('Serving Size in grams: '),
                Flexible(child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'grams',
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)
                    ),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
                    ],
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                )),
              ],
            ),
            Row(
              children: [
                const Text('Ingredient Name: '),
                Flexible(child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'name',
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)
                    ),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]+'))
                    ],
                    keyboardType: TextInputType.text,
                )),
              ],
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('Alternate measures:'),
                    PlusSignTile((context) {}, padding: const EdgeInsets.fromLTRB(0, 16, 0, 0)),
                    const AltMeasureFormField(),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: ListView.builder(
                // children: type2dataclasses[Nutrients]!.attributes.keys.map((e) => nutrientFormField(e)).toList(),
                itemBuilder: (BuildContext context, int index)=>NutrientFormField(nutList[index]),
                itemCount: nutList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // children: emptyNutrient.attributes__.values.map((e) => nutrientFormField(e)).toList(),
              ),
            ),
            Center(child: ElevatedButton(onPressed: (){}, child: const Text('Submit')))
            // ...?type2dataclasses[Nutrients]?.attributes.keys.map((e) => nutrientFormField(e))
          ],
        ).pad(const EdgeInsets.all(12)),
      ),
    );
  }
}

// Widget nutrientFormField(Nutrient nut)=>
//     Row(
//       children: [
//         Padding(
//           padding: const EdgeInsets.fromLTRB(10, 5, 20, 5),
//           child: Text('${replaceTextForForm(nut.name)}:'),
//         ),
//         Flexible(
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(20, 5, 50, 5),
//             child: TextFormField(
//                 decoration: InputDecoration(
//                   contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
//                   // hintText: '0',
//                   labelText: nut.unit
//                 ),
//                 inputFormatters: <TextInputFormatter>[
//                   FilteringTextInputFormatter.allow(RegExp(r'[\d.]+'))
//                 ],
//               keyboardType: const TextInputType.numberWithOptions(decimal: true),
//             ),
//           ),
//         ),
//       ],
//     );

class NutrientFormField extends StatelessWidget {
  final Nutrient nut;
  const NutrientFormField(this.nut, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 20, 5),
          child: Text('${replaceTextForForm(nut.name)}:'),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 50, 5),
            child: TextFormField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  // hintText: '0',
                  labelText: nut.unit
              ),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
                // \d*\.?\d+
              ],
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
          ),
        ),
      ],
    );
  }
}

class AltMeasureFormField extends StatelessWidget {
  const AltMeasureFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Name: '),
        Flexible(child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
          child: TextFormField(
            decoration: const InputDecoration(
                labelText: 'name',
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z \-]+'))
            ],
          ),
        )),
        const Text('Grams: '),
        Flexible(child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
          child: TextFormField(
            decoration: const InputDecoration(

              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              labelText: 'grams',
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
            ],
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
        )),
      ],
    );
  }
}

// Row altMeasureFormField()=>
//     Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         const Text('Name: '),
//         Flexible(child: Padding(
//           padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
//           child: TextFormField(
//               decoration: const InputDecoration(
//                 labelText: 'name',
//                 contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)
//               ),
//               inputFormatters: <TextInputFormatter>[
//                 FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z \-]+'))
//               ],
//           ),
//         )),
//         const Text('Grams: '),
//         Flexible(child: Padding(
//           padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
//           child: TextFormField(
//               decoration: const InputDecoration(
//
//                 contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//                 labelText: 'grams',
//               ),
//               inputFormatters: <TextInputFormatter>[
//                 FilteringTextInputFormatter.allow(RegExp(r'[\d.]+'))
//               ],
//             keyboardType: const TextInputType.numberWithOptions(decimal: true),
//           ),
//         )),
//       ],
//     );

String replaceTextForForm(String input){
  final lowercase = input.toLowerCase();
  if (lowercase == 'ala' || lowercase == 'epa' || lowercase == 'dha' || lowercase == 'dpa'){
    return input.toUpperCase();
  }
  final uppercaseRegex = RegExp(r'([A-Z])', caseSensitive: true);
  input = input.replaceAllMapped(uppercaseRegex, (Match m) => ' ${m[1]}').trim();
  input = input.substring(0, 1).toUpperCase() + input.substring(1);
  return input;
}
