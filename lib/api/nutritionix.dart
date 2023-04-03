import 'package:dio/dio.dart';
import 'package:nutrition_app/domain.dart';

final dio = Dio();
// TODO TYPE API CALLS
/// Use in a try block
Future<Response> apiCallFromUpc(int upc, Settings settings) async {
  const url = 'https://trackapi.nutritionix.com/v2/search/item';
  final queryParameters = {
    'upc': upc.toString(),
    'claims': 'true',
    'taxonomy': 'true',
  };
  final headers = {
    'Accept': 'application/json',
    'x-app-id': settings.appId,
    'x-app-key': settings.apikey,
  };

  final dio = Dio();

  try {
    final response = await dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    // print(response.data);
    return response;
  } on DioError catch (e) {
    print(e);
    print(e.error);
    print(e.response);
    print(e.type);
    print(e.message);
    print(e.requestOptions);
    rethrow;
    // TODO HANDLE ERROR
  }
}

Future<Response> apiCallFromString(String string, Settings settings) async {
  const url = 'https://trackapi.nutritionix.com/v2/natural/nutrients';
  final headers = {
    'x-app-id': settings.appId,
    'x-app-key': settings.apikey,
    'content': 'application/json',
    'Content-Type': 'application/x-www-form-urlencoded',
  };
  final data = {
    'query': string,
  };
  try {
    final response = await dio.post(
      url,
      data: data,
      options: Options(headers: headers),
    );
    return response;
  }
  on DioError catch(e){
    // TODO HANDLE ERROR
    print(e.error);
    print(e.response);
    print(e.type);
    print(e.message);
    print(e.requestOptions);
    rethrow;
  }
  catch (e) {
    print('-----------');
    print(e);
    rethrow;
  }
}

typedef NutrientConstructor = Nutrient Function(num value, {String name, String unit});

const Map<int, NutrientConstructor> apiId2nutrient = {
    301: Nutrient.Calcium,
    205: Nutrient.Carbohydrate,
    601: Nutrient.Cholesterol,
    208: Nutrient.Calories,
    606: Nutrient.SaturatedFat,
    204: Nutrient.TotalFat,
    605: Nutrient.TransFat,
    303: Nutrient.Iron,
    291: Nutrient.Fiber,
    306: Nutrient.Potassium,
    307: Nutrient.Sodium,
    203: Nutrient.Protein,
    269: Nutrient.Sugars,
    421: Nutrient.Choline,
    312: Nutrient.Copper,
    851: Nutrient.ALA,
    685: Nutrient.LinoleicAcid,
    629: Nutrient.EPA,
    631: Nutrient.DPA,
    621: Nutrient.DHA,
    417: Nutrient.Folate,
    304: Nutrient.Magnesium,
    315: Nutrient.Manganese,
    406: Nutrient.Niacin,
    305: Nutrient.Phosphorus,
    410: Nutrient.PantothenicAcid,
    405: Nutrient.Riboflavin,
    317: Nutrient.Selenium,
    404: Nutrient.Thiamin,
    323: Nutrient.VitaminE,
    320: Nutrient.VitaminA,
    418: Nutrient.VitaminB12,
    415: Nutrient.VitaminB6,
    401: Nutrient.VitaminC,
    328: Nutrient.VitaminD,
    430: Nutrient.VitaminK,
    309: Nutrient.Zinc,
};
