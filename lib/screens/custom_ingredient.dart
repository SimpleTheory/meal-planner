import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/mydataclasses/metadata.dart';
import 'dart:io';
import 'package:nutrition_app/utils/local_widgets.dart';
import 'package:nutrition_app/utils/utils.dart';

class CustomIngredientPage extends StatelessWidget {
  const CustomIngredientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ingredients')),
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
                      FilteringTextInputFormatter.allow(RegExp(r'[\d.]+'))
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
            const Text('Alternate measures:'),
            plusSignTile(() {}),
            altMeasureFormField(),
            ...?type2dataclasses[Nutrients]?.attributes.keys.map((e) => nutrientFormField(e))
          ],
        ).pad(const EdgeInsets.all(12)),
      ),
    );
  }
}

Widget nutrientFormField(String nutName)=>
  // TODO Add units to form field hint somehow
    Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 20, 5),
          child: Text('${replaceTextForForm(nutName)}:'),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 50, 5),
            child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  // hintText: '0',
                  labelText: replaceTextForForm(nutName)
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[\d.]+'))
                ],
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
          ),
        ),
      ],
    );

Row altMeasureFormField()=>
    Row(
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
                FilteringTextInputFormatter.allow(RegExp(r'[\d.]+'))
              ],
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
        )),
      ],
    );
String replaceTextForForm(String input){
  final uppercaseRegex = RegExp(r'([A-Z])', caseSensitive: true);
  input = input.replaceAllMapped(uppercaseRegex, (Match m) => ' ${m[1]}').trim();
  input = input.substring(0, 1).toUpperCase() + input.substring(1);
  return input;
}
