import 'dart:core';
import 'package:ari_utils/ari_utils.dart';
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:dataclasses/dataclasses.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

enum Sex { M, F }

enum Activity { Sedentary, Low_Active, Active, Very_Active }

final valueUnitSearch = RegExp(r'^([0-9.,]+) (\w+)');
final macroSearch = RegExp(r'^\d+ - \d+ \w+');
const driCalcBaseUrl = 'https://www.nal.usda.gov/human-nutrition-and-food-safety/dri-calculator';
const Map<String, String> constDirPostDict = {
  'measurement_units': 'std',
  'age_type': 'yrs',
  'cm': '',
  'kilos': '',
  'op': 'Submit',
  'form_id': 'dri_calculator_form'
};
const List<String>exclusionList = [
  'Sex',
  'Age',
  'Height',
  'Weight',
  'Activity level',
  'Dietary Cholesterol',
  'Body Mass Index (BMI) More Information About Bmi',
  'Macronutrient',
  'Saturated fatty acids',
  'Trans fatty acids',
  'Vitamin',
  'Total Water',
  'Carotenoids',
  'Mineral',
  'Essential',
  'Non-Essential',
  'Arsenic',
  'Silicon',
  'Sulfate'
];

@Dataclass(constructor: false)
class AnthroMetrics {
  Sex sex;
  int age;
  int weight;
  int feet;
  int inches;
  Activity activity;

  AnthroMetrics(
      {required this.sex,
      required this.age,
      required this.weight,
      required this.feet,
      required this.inches,
      required this.activity}
      );

  @Generate()

  factory AnthroMetrics.fromMetric(
      Sex sex, int age, int weight, int height, Activity activity) {
    weight = (weight * 2.20462).round();
    height = (height * 0.393701).round();
    int feet = height ~/ 12;
    int inches = height % 12;
    return AnthroMetrics(
        sex: sex,
        age: age,
        weight: weight,
        feet: feet,
        inches: inches,
        activity: activity);
  }

  Map<String, String> toDictForPost() {
    String sexStr = sex == Sex.M ? 'male' : 'female';
    Map<String, String> result = {
      'age_value': age.toString(),
      'sex': sexStr,
      'feet': feet.toString(),
      'inches': inches.toString(),
      'activity_level': activity.name.toString().replaceAll('_', ' '),
      'pounds': weight.toString()
    };
    if (sex == Sex.F) {
      result['pregnancy-lactating'] = 'none';
    }
    return result;
  }

}

@Dataclass()
class DRI {
  String name;
  num? dri;
  num? upperLimit;
  String? unit;

  DRI(this.name, {this.dri, this.upperLimit, this.unit}) {
    if (dri == 0) {
      dri = null;
    }
    if (upperLimit == 0){
      upperLimit = null;
    }
    substitutions();
  }

  @override
  String toString() {
    if (upperLimit != null) {
      return '$name: $dri - $upperLimit $unit';
    } else {
      return '$name: $dri $unit';
    }
  }

  void substitutions() {
    if (name == 'Estimated Daily Caloric Needs') {
      name = 'Calories';
    }
    if (name == 'Sodium') {
      upperLimit = 3000;
    }
    if (name == 'Magnesium') {
      upperLimit = null;
    }
  }

  factory DRI.driMacro(List<String> instantiationString,
      [AnthroMetrics? anthro]) {
    RegExpMatch? search = macroSearch.firstMatch(instantiationString[1]);
    String name = instantiationString[0];
    num? dri;
    num? ul;
    String? unit;

    if (search != null) {
      List<String?> values = RegExp(r'[0-9,.]+')
          .allMatches(search.group(0)!)
          .map((e) => e.group(0))
          .toList();
      dri = toNum(values[0]);
      ul = toNum(values[1]);
      unit = RegExp(r'[A-Za-z]+').firstMatch(search.group(0)!)?.group(0);
    } else {
      RegExpMatch? search = valueUnitSearch.firstMatch(instantiationString[1]);
      dri = search!=null ? toNum(RegExp(r'[0-9,.]+').firstMatch(search.group(0)!)?.group(0)) : null;
      unit = search!=null ? RegExp(r'[A-Za-z]+').firstMatch(search.group(0)!)?.group(0) : null;
    }
    if (name == 'Protein' && anthro != null) {
      ul = (anthro.weight * 0.8).round();
    }
    return DRI(name, dri: dri, upperLimit: ul, unit: unit);
  }

  factory DRI.driMicro(List<String> instantiationString) {
    RegExpMatch? driLine = valueUnitSearch.firstMatch(instantiationString[1]);
    RegExpMatch? ulLine = valueUnitSearch.firstMatch(instantiationString[2]);
    String? dri = driLine?.group(1);
    String? unit = driLine?.group(2);
    String? ul = ulLine?.group(1);
    return DRI(instantiationString[0], dri: toNum(dri), upperLimit: toNum(ul), unit: unit);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DRI &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          dri == other.dri &&
          upperLimit == other.upperLimit &&
          unit == other.unit;

  @override
  int get hashCode =>
      name.hashCode ^ dri.hashCode ^ upperLimit.hashCode ^ unit.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dri': dri,
      'upperLimit': upperLimit,
      'unit': unit,
    };
  }

  factory DRI.fromMap(Map<String, dynamic> map) {
    return DRI(
      map['name'] as String,
      dri: map['dri'] as num,
      upperLimit: map['upperLimit'] as num,
      unit: map['unit'] as String,
    );
  }
}

num? toNum(num) {
  if (num is! String) {
    return num;
  }
  final answer = double.parse(num.replaceAll(',', ''));
  if (answer.isInt) {
    return answer.toInt();
  } else {
    return answer;
  }
}

Future<String> driCalc(AnthroMetrics metrics) async {
  CookieJar cookieJar = CookieJar();
  Dio dio = Dio();
  dio.interceptors.add(CookieManager(cookieJar));
  Response baseResponse = await dio.get(
      driCalcBaseUrl,
      options: Options(headers: {'Cookie': 'CFIWebMonPersistent-77=%7B%22LastAccept%22%3Anull%2C%22LastDecline%22%3A1679639108697%7D; ApplicationGatewayAffinityCORS=6cd89f82ce3b87d4f94610b80ec75719; ApplicationGatewayAffinity=6cd89f82ce3b87d4f94610b80ec75719; GUIDCookie=92dd616e-d3c1-4ab7-9b06-dd71f3873498; SSESS36ddc8e3532cfd4477f8a08bedf459b4=cIOwTFWiEX6x03SXl31OGZMhaLUMEnqM8%2CU68Y01JyR5h03u; CFIWebMonSession=%7B%22GUID%22%3A%22c144b9ab-a5ac-7c19-d4f1-679639074244%22%2C%22EmailPhone%22%3A%22%22%2C%22HttpReferer%22%3A%22https%3A//www.google.com/%22...usda.gov/human-nutrition-and-food-safety/dri-calculator/results%22%2C%22SiteReferrer%22%3A%22https%3A//www.google.com/%22%2C%22LastPopUpPage%22%3A%22https%3A//www.nal.usda.gov/human-nutrition-and-food-safety/dri-calculator%22%2C%22TimeSpentonSite%22%3A0%2C%22GoogleAnalyticsValue%22%3A%2292dd616e-d3c1-4ab7-9b06-dd71f3873498%22%2C%22Dimension%22%3A%22%22%2C%22AdditionalAttributes%22%3A%7B%7D%2C%22ClickTracker%22%3A%22%22%2C%22PageIndex%22%3A0%2C%22AllCookies%22%3A%22%22%2C%22AllCustomVariables%22%3A%22%22%7D'}
      ));
  // Needs a base cookie to work as above ^ find out what makes it work
  // print(baseResponse.headers);
  // print(baseResponse.requestOptions.headers);
  // List<ClientCookie> clientCookie = baseResponse.headers['set-cookie']!.map((e) => ClientCookie.fromSetCookie(e)).toList();
  // print(clientCookie.map((e) => e.toReqHeader).toList());
  Map<String,String> baseDict = Map<String, String>.from(constDirPostDict);
  baseDict['form_build_id'] = getFormBuildId(baseResponse.data);
  final Map<String, String> postDict = Map<String, String>.from(baseDict)..addAll(metrics.toDictForPost());
  // print(postDict);
  Response driResponse = await dio.post(
    driCalcBaseUrl,
    data: FormData.fromMap(postDict),
    // options: Options(headers: {for (ClientCookie cookie in clientCookie) cookie.name: cookie.value})
  );

  return driResponse.data;
}

String getFormBuildId(String html) {
  RegExp regex = RegExp(r'(?<="form_build_id" value=")\S+(?=")');
  return regex.firstMatch(html)?.group(0) ?? '';
}

List<DRI> parseDRI(String dri, AnthroMetrics anthro) {
  List<DRI> driList = [];
  BeautifulSoup soup = BeautifulSoup(dri);
  // print(soup.findAll('tr'));
  for (Bs4Element tr in soup.findAll('tr')) {
    List<String> currentText = tr.text.trim().split('\n').map((e) => e.trim()).toList();
    // print(currentText);
    if (exclusionList.contains(currentText[0])) {
      continue;
    }
    else if (currentText.length == 2) {
      driList.add(DRI.driMacro(currentText, anthro));
    }
    else {
      driList.add(DRI.driMicro(currentText));
    }
  }
  return driList;
}

int toInches(int feet, int inches){
  return (feet * 12) + inches;
}