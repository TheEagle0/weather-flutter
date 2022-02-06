import 'dart:convert';
import 'dart:io';
import 'package:weather/utility/constants.dart';
import 'package:http/http.dart' as http;
import 'app_exption.dart';

class ApiManager {
  final _baseUrl = 'api.weatherapi.com';

  Future<dynamic> get({required dynamic lon, required dynamic lat}) async {
    var responseJson;
    final Map<String, dynamic> queryParams = {
      'q': '$lat,$lon',
      'key': Constants.K_API_Key
    };
    try {
      final url = Uri.https(_baseUrl, '/v1/forecast.json', queryParams);
      final response = await http.get(url);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
