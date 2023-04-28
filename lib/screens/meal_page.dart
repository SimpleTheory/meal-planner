import 'package:flutter/material.dart';
import 'package:nutrition_app/utils/local_widgets.dart';
import 'package:nutrition_app/utils/utils.dart';
import 'package:nutrition_app/domain.dart';

import '../temp_dummy_data.dart';



class MealPage extends StatelessWidget {
  const MealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meals')),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(5, 8, 5, 2.5),
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
                  plusSignTile(() { }),
                  mealTile(dummyObject),
                  mealTile(dummyObject),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MealPopUpEnumHolder{
  const MealPopUpEnumHolder(Meal meal, PopUpOptions option);
}

ListTile mealTile(Meal meal){
  // TODO CREATE WAY TO RENDER CUSTOM EMOJIS WITH BRANDON FONT
  // print(meal.photo);
  return ListTile(
    title: Text(meal.name),
    trailing: PopupMenuButton(
      itemBuilder: (BuildContext context) => [
      PopupMenuItem(value: MealPopUpEnumHolder(meal, PopUpOptions.edit),child: const Text('Edit'),),
      PopupMenuItem(value: MealPopUpEnumHolder(meal, PopUpOptions.delete), child: const Text('Delete')),
      PopupMenuItem(value: MealPopUpEnumHolder(meal, PopUpOptions.duplicate),child: const Text('Duplicate'),),
      ],
    ),
    subtitle: Text(
            'Serving:  '
            "${meal.baseNutrient.nutrients.calories.value.round()}\u{1F525}  "
            '${meal.baseNutrient.nutrients.carbohydrate.value.round()}\u{1F35E}  '
            '${meal.baseNutrient.nutrients.protein.value.round()}\u{1F969}  '
            // '${meal.baseNutrient.nutrients.unsaturatedFat.value.round()}\u{1FAD2}  '
            '${meal.baseNutrient.nutrients.unsaturatedFat.value.round()}$olive  '
            // '${meal.baseNutrient.nutrients.saturatedFat.value.round()}\u{1F9C8}',
            '${meal.baseNutrient.nutrients.saturatedFat.value.round()}$butter'
    ),
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
    leading: getImage(meal.photo),
    onTap: (){},
  );
}


