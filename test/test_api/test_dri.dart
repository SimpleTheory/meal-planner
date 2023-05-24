import 'package:flutter_test/flutter_test.dart';
import 'package:nutrition_app/api/dri.dart';
import 'package:nutrition_app/domain.dart';
AnthroMetrics metrics = AnthroMetrics(sex: Sex.M, age: 23, weight: 200, feet: 6, inches: 3, activity: Activity.Sedentary);

void main(){
  test('dri_calc', () async {
    String x = await driCalc(metrics);
    expect(x.contains('fiber'), true);

  });
  test('parse dri', () async {
    String x = await driCalc(metrics);
    List<DRI> something  = parseDRI(x, metrics);
    expect(something[0], DRI('Calories', unit: 'kcal', dri: 2914));
    // for (var s in something){
    //   print(s);
    // }
  });
  test('etl dri', () async {
    String x = await driCalc(metrics);
    List<DRI> something  = parseDRI(x, metrics);
    Map result = prepDRIMapFromAPI(something);
    expect(result['ala'], DRI('α-Linolenic Acid', unit: 'grams', dri: 1.6));
    expect(result['linoleicAcid'], DRI('Linoleic Acid', unit: 'grams', dri: 17));
  });
  test('final dris', () async {
    String x = await driCalc(metrics);
    List<DRI> something  = parseDRI(x, metrics);
    Map map = prepDRIMapFromAPI(something);
    map['sugars'] = DRI('Sugars', unit: 'g', upperLimit: 36);
    String expectation = 'DRIS(calcium: Calcium: 1000 - 2500 mg, carbohydrate: Carbohydrate: 328 - 474 g, cholesterol: Cholesterol: null - 300 mg, calories: Calories: 2914 kcal, totalFat: Total Fat: 65 - 113 g, iron: Iron: 8 - 45 mg, fiber: Total Fiber: 38 g, potassium: Potassium: 3400 mg, sodium: Sodium: 1500 - 3000 mg, protein: Protein: 73 - 160 g, sugars: Sugars: null - 36 g, choline: Choline: 550.0 - 3500.0 mg, copper: Copper: 900 - 10000 mcg, ala: α-Linolenic Acid: 1.6 g, linoleicAcid: Linoleic Acid: 17 g, epa: EPA: 200 - 1800 mg, dpa: DPA: 50 mg, dha: DHA: 200 - 1800 mg, folate: Folate: 400 - 1000 mcg, magnesium: Magnesium: 400 mg, manganese: Manganese: 2.3 - 11 mg, niacin: Niacin: 16 - 35 mg, phosphorus: Phosphorus: 0.7 - 4 g, pantothenicAcid: Pantothenic Acid: 5 mg, riboflavin: Riboflavin: 1.3 mg, selenium: Selenium: 55 - 400 mcg, thiamin: Thiamin: 1.2 mg, vitaminE: Vitamin E: 15 - 1000 mg, vitaminA: Vitamin A: 900 - 3000 mcg, vitaminB12: Vitamin B12: 2.4 mcg, vitaminB6: Vitamin B6: 1.3 - 100 mg, vitaminC: Vitamin C: 90 - 2000 mg, vitaminD: Vitamin D: 15 - 100 mcg, vitaminK: Vitamin K: 120 mcg, zinc: Zinc: 11 - 40 mg, transFat: Trans Fat: null - 1 g, unsaturatedFat: Unsaturated Fat: 58.5 - 113 g, saturatedFat: Saturated Fat: null - 32.37777777777778 g)';
    DRIS result = DRIS.fromMap(map);
    expect(result.toString(), expectation);
  });
  test('DRIS fromAPI', ()async{
    DRIS dris = await DRIS.fromAPI(metrics);
    String expectation = 'DRIS(calcium: Calcium: 1000 - 2500 mg, carbohydrate: Carbohydrate: 328 - 474 g, cholesterol: Cholesterol: null - 300 mg, calories: Calories: 2622.6 - 2914 kcal, totalFat: Total Fat: 65 - 113 g, iron: Iron: 8 - 45 mg, fiber: Total Fiber: 38 g, potassium: Potassium: 3400 mg, sodium: Sodium: 1500 - 3000 mg, protein: Protein: 73 - 160 g, sugars: Sugars: null - 36 g, choline: Choline: 550.0 - 3500.0 mg, copper: Copper: 900 - 10000 mcg, ala: α-Linolenic Acid: 1.6 g, linoleicAcid: Linoleic Acid: 17 g, epa: EPA: 200 - 1800 mg, dpa: DPA: 50 mg, dha: DHA: 200 - 1800 mg, folate: Folate: 400 - 1000 mcg, magnesium: Magnesium: 400 mg, manganese: Manganese: 2.3 - 11 mg, niacin: Niacin: 16 - 35 mg, phosphorus: Phosphorus: 0.7 - 4 g, pantothenicAcid: Pantothenic Acid: 5 mg, riboflavin: Riboflavin: 1.3 mg, selenium: Selenium: 55 - 400 mcg, thiamin: Thiamin: 1.2 mg, vitaminE: Vitamin E: 15 - 1000 mg, vitaminA: Vitamin A: 900 - 3000 mcg, vitaminB12: Vitamin B12: 2.4 mcg, vitaminB6: Vitamin B6: 1.3 - 100 mg, vitaminC: Vitamin C: 90 - 2000 mg, vitaminD: Vitamin D: 15 - 100 mcg, vitaminK: Vitamin K: 120 mcg, zinc: Zinc: 11 - 40 mg, transFat: Trans Fat: null - 1 g, unsaturatedFat: Unsaturated Fat: 58.5 - 113 g, saturatedFat: Saturated Fat: null - 32.37777777777778 g)';
    expect(dris.toString(), expectation);
  });
}