import 'package:ari_utils/ari_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/temp_dummy_data.dart';
import 'package:nutrition_app/utils/local_widgets.dart';
import 'package:nutrition_app/utils/utils.dart';

class DietPage extends StatelessWidget {
  Diet diet;
  DietPage({Key? key, required this.diet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(diet.name)),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text(diet.name)),
            ListTile(title: const Text('Days'), onTap: (){},),
            ListTile(title: const Text('Shopping List'), onTap: (){},),
            ListTile(title: const Text('Average Day Breakdown'), onTap: (){},),
            ListTile(title: const Text('DRI Configuration'), onTap: (){},),
            ListTile(title: const Text('Return to Home Page'), onTap: (){Navigator.pop(context); Navigator.pop(context);},),
          ],
          // DrawerHeader(child: Text(),)
        ),
      ),
      body: ListView(
        children: [
          plusSignTile(() {}),
          ...diet.days.map((e) => dayTile(e))

        ],
      ),
    );
  }
}

Widget dayTile(Day day){
  return ExpansionTile(
    title: Center(child: Text('Day ${day.name}')),
    subtitle: Center(child: nutrientText(nutrients: day.nutrients, initText: '    Nutrients:  ')),
    children: [
      plusSignTile(() {}),
      ...day.meals.map<Widget>((e) => mealComponentTile(e))
    ],
    
  );
}
class MealComponentPopUpEnumHolder{
  MealComponent mealComponent;
  PopUpOptions popUpOption;
  MealComponentPopUpEnumHolder(this.mealComponent, this.popUpOption);
}

Widget mealComponentTile(MealComponent meal){
  return ListTile(
    title: Row(
      children: [
        Text(meal.name),
        SizedBox(
          width: 100,
          height: 40,
          child: TextFormField(initialValue: roundDecimal(meal.grams.toDouble(), 3).toString(),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              border: InputBorder.none
          ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[\d.]+'))
            ],
            keyboardType: const TextInputType.numberWithOptions(decimal: true),),
        ),
        DropdownButton<String>(
          value: 'grams',
            items: meal.reference.altMeasures2grams.keys.map<DropdownMenuItem<String>>
              ((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (String? newAltMeasure){})

      ],
    ).pad(const EdgeInsets.all(16)),
    trailing: PopupMenuButton(
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(value: MealComponentPopUpEnumHolder(meal, PopUpOptions.edit),child: const Text('Edit'),),
        PopupMenuItem(value: MealComponentPopUpEnumHolder(meal, PopUpOptions.delete), child: const Text('Delete')),
        PopupMenuItem(value: MealComponentPopUpEnumHolder(meal, PopUpOptions.duplicate),child: const Text('Duplicate'),),
      ],
    ),
    subtitle: nutrientText(nutrients: meal.nutrients, grams: meal.grams.round()),
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
    leading: getImage(meal.reference.photo),
    onTap: (){},
  );
}