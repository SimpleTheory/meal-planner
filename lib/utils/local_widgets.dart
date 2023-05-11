import 'package:ari_utils/ari_utils.dart';
import 'package:flutter/material.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/utils/utils.dart';

Widget plusSignTile(void Function()? onTap, {EdgeInsets? padding}) =>
  Padding(
    padding: padding ?? const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: ListTile(
        onTap: onTap,
        title: const Center(child: Icon(Icons.add),),
        tileColor: const Color.fromRGBO(240, 240, 240, 30),
        shape: const BeveledRectangleBorder(
          side: BorderSide(color: Color.fromRGBO(150, 150, 150, 80), width: 1),
    // borderRadius: BorderRadius.(5),
          ),
        ),
      );

Text nutrientText({required Nutrients nutrients, num? grams, String? initText, TextStyle? style}){
  String serving = grams == null ? '' : ' (${grams}g)';
  initText ??= 'Serving$serving:  ';
  return Text(
      '$initText'
          "${nutrients.calories.value.round()}\u{1F525}  "
          '${nutrients.carbohydrate.value.round()}\u{1F35E}  '
          '${nutrients.protein.value.round()}\u{1F969}  '
      // '${meal.baseNutrient.nutrients.unsaturatedFat.value.round()}\u{1FAD2}  '
          '${nutrients.unsaturatedFat.value.round()}$olive  '
      // '${meal.baseNutrient.nutrients.saturatedFat.value.round()}\u{1F9C8}',
          '${nutrients.saturatedFat.value.round()}$butter',
    style: style,
  );
}

Widget dayStyleNutrientDisplay(Nutrients nutrients, DRIS dris){
  final trackedNuts = dris.comparator(nutrients);
  List<Widget> nutWidgets = [];
  for (MapEntry<String, List> nut in trackedNuts.entries){
    final color = nut.value[2].startsWith(RegExp(r'[+-]')) ? Colors.red : Colors.green;
    nutWidgets.add(
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
        child: Column(
            children: [
              Text(DRIS.representor[nut.key] ?? nut.key),
              Text(nut.value[2], style: TextStyle(color: color))
            ]
        ),
      )
    );
  }
  return Container(
    height: 50,
    width: double.infinity,
    child: ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: nutWidgets,

    ),
  );
}

Widget mealStyleNutrientDisplay(Nutrients nutrients){
  List<Widget> nutWidgets = [];
  for (MapEntry<String, dynamic> nut in nutrients.attributes__.entries){
    nutWidgets.add(
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
        child: Column(
            children: [
              Text(DRIS.representor[nut.key] ?? nut.key),
              Text(roundDecimal(nut.value.value.toDouble(), 2).toString())
            ]
        ),
      )
    );
  }
  return Container(
    height: 50,
    width: double.infinity,
    child: ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: nutWidgets,

    ),
  );
}