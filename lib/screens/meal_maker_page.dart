import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrition_app/screens/custom_ingredient.dart';
import 'package:nutrition_app/screens/diet_details_screen.dart';
import 'package:nutrition_app/utils/local_widgets.dart';
import 'package:nutrition_app/utils/utils.dart';
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
                MealStyleNutrientDisplay(current_meal!.baseNutrient.nutrients),
                PlusSignTile(() {}),
                // ListView.builder(
                //   itemBuilder: (context, index)=>MealComponentTile(current_meal!.ingredients[index]),
                //   itemCount: ingredients.length,
                //   shrinkWrap: true,
                //   physics: const ClampingScrollPhysics(),
                // )
                ...current_meal!.ingredients.map((e) => MealComponentTile(e)),
              ],
            ),
            Row(children: [
              const Text('Subrecipe: ', style: TextStyle(fontSize: 20)), Switch(value: false, onChanged: (bool isSubRecipe){})
            ],),
            const Text('Alternate measures:', style: TextStyle(fontSize: 20),),
            PlusSignTile(() {}),
            const AltMeasureFormField(),
            Container(
              decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.grey))),
              child: Column(
                children: const [
                  Text('Notes:', style: TextStyle(fontSize: 20),),
                  TextField(
                    decoration: InputDecoration(contentPadding: EdgeInsets.fromLTRB(8, 8, 0, 8)),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                ],
              ),
            ),
            ElevatedButton(onPressed: (){}, child: const Text('Submit'),),


          ],
        ).pad(const EdgeInsets.all(12)),
      ),
    );
  }
}