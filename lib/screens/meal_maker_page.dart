import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrition_app/screens/custom_ingredient.dart';
import 'package:nutrition_app/screens/diet_details_screen.dart';
import 'package:nutrition_app/utils/local_widgets.dart';
import 'package:nutrition_app/utils/utils.dart';
import 'dart:io';
import 'package:nutrition_app/temp_dummy_data.dart';

final current_meal = meals['breaky'];

class MealMakerPage extends StatelessWidget {
  const MealMakerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meal Maker: breaky')),
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
                const Text('Name: '),
                Flexible(child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'name',
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)
                  ),
                )),
              ],
            ),
            Row(
              children: [
                const Text('Servings: '),
                Flexible(child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Servings',
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number
                )),
              ],
            ),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                plusSignTile(() {}),
                ...current_meal!.ingredients.map((e) => mealComponentTile(e)),
              ],
            ),
            Row(children: [
              Text('Subrecipe: ', style: TextStyle(fontSize: 20)), Switch(value: false, onChanged: (bool isSubRecipe){})
            ],),
            Text('Alternate measures:', style: TextStyle(fontSize: 20),),
            plusSignTile(() {}),
            altMeasureFormField(),

          ],
        ).pad(const EdgeInsets.all(12)),
      ),
    );
  }
}