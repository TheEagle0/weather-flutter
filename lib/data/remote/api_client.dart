import 'package:weather/data/entities/current_location_weather.dart';
import 'package:weather/data/remote/api_manager.dart';

class ApiClient {
  ApiManager _apiManager = ApiManager();

  Future<CurrentLocationWeather> fetchCurrentLocationWeather(
      {required dynamic lon, required dynamic lat}) async {
    final response = await _apiManager.get(lon: lon, lat: lat);
    return CurrentLocationWeather.fromJson(response);
  }
}
