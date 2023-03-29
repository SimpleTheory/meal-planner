import 'dart:core';
import 'package:ari_utils/ari_utils.dart';
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:nutrition_app/domain.dart';



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



num? toNum(number) {
  if (number is! String) {
    return number;
  }
  final answer = double.parse(number.replaceAll(',', ''));
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

// Nutrients dris2Nutrients(List<DRI> dris){
//   Map<String, Nutrient> map = {};
//   for (DRI dri in dris){
//     String current = dri.name.replaceAll(' ', '');
//     switch(current){
//       case 'α-Linolenic Acid': current = 'ALA'; break;
//       case 'α-Linolenic Acid': current = 'ALA'; break;
//       case 'α-Linolenic Acid': current = 'ALA'; break;
//       case 'α-Linolenic Acid': current = 'ALA'; break;
//       default: current = current;
//
//     }
//   }
// }