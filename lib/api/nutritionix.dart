import 'package:dio/dio.dart';
import 'package:nutrition_app/domain.dart';

final dio = Dio();

apiCallFromUpc(int upc, Settings settings) async {
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
  }
}

apiCallFromString(String string, Settings settings) async {
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
    print(e.error);
    print(e.response);
    print(e.type);
    print(e.message);
    print(e.requestOptions);
  }
  catch (e) {
    print('-----------');
    print(e);
  }
}


