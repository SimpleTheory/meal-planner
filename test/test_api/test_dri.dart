import 'package:flutter_test/flutter_test.dart';
import 'package:nutrition_app/api/dri.dart';
import 'package:nutrition_app/domain.dart';

void main(){
  test('dri_calc', () async {
    AnthroMetrics metrics = AnthroMetrics(sex: Sex.M, age: 23, weight: 200, feet: 6, inches: 3, activity: Activity.Low_Active);
    String x = await driCalc(metrics);
    expect(x.contains('fiber'), true);

  });
  test('parse dri', () async {
    AnthroMetrics metrics = AnthroMetrics(sex: Sex.M, age: 23, weight: 200, feet: 6, inches: 3, activity: Activity.Sedentary);
    String x = await driCalc(metrics);
    List<DRI> something  = parseDRI(x, metrics);
    expect(something[0], DRI('Calories', unit: 'kcal', dri: 2914));
    // for (var s in something){
    //   print(s);
    // }
  });
}