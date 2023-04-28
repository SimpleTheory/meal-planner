import 'package:flutter/material.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/utils/utils.dart';

Widget plusSignTile(void Function()? onTap) =>
  Padding(
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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