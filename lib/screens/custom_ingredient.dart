import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/mydataclasses/metadata.dart';
import 'dart:io';
import 'package:nutrition_app/utils/local_widgets.dart';

class IngredientModificationPage extends StatelessWidget {
  const IngredientModificationPage({Key? key}) : super(key: key);

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
                  child: Image.file(File('cache/images/null.png'), width: 200, height: 200,)
              ),
            ),
            Row(
              children: [
                const Text('Serving Size in grams: '),
                Flexible(child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'grams',
                    ),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ]
                )),
              ],
            ),
            Row(
              children: [
                const Text('Name: '),
                Flexible(child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'name',
                    ),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]+'))
                    ]
                )),
              ],
            ),
            const Text('Alternate measures:'),
            Row(
              children: [
                const Text('Alternate Measure Name: '),
                Flexible(child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'name',
                    ),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z \-]+'))
                    ]
                )),
                const Text('Alternate Measure Grams: '),
                Flexible(child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'grams',
                    ),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[\d.]+'))
                    ]
                )),
              ],
            ),
            plusSignTile(() {}),
            ...?type2dataclasses[Nutrients]?.attributes.keys.map((e) => nutrientFormField(e))
          ],
        ),
      ),
    );
  }
}

Widget nutrientFormField(String nutName)=>
    Row(
      children: [
        Text('$nutName:'),
        Flexible(
          child: TextFormField(
              decoration: InputDecoration(
                hintText: '0',
                labelText: nutName
              ),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[\d.]+'))
              ]
          ),
        ),
      ],
    );