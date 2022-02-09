import 'package:flutter/widgets.dart';
import 'package:location/location.dart';
import 'package:weather/data/entities/current_location_weather.dart';
import 'package:weather/data/remote/api_client.dart';

class HomeProvider with ChangeNotifier {
  CurrentLocationWeather? weatherData;
  bool isLoading=true;

  HomeProvider() {
    final Location location = Location();
    location.requestPermission().then((value) => {
          if (value == PermissionStatus.granted ||
              value == PermissionStatus.grantedLimited)
            {
              location.getLocation().then((value) => {
                    print('${value.latitude}     ${value.longitude}'),
                    getCurrentLocationWeather(
                        lon: value.longitude.toString(),
                        lat: value.latitude.toString())
                  })
            }
        });
  }

  void getCurrentLocationWeather(
      {required dynamic lon, required dynamic lat}) async {
    debugPrint('in CAll APi');
    setLoading(true);
    weatherData =
        await ApiClient().fetchCurrentLocationWeather(lon: lon, lat: lat);
    setLoading(false);
    print(' data   ${weatherData?.forecast?.toJson()}');
    notifyListeners();
  }

  void setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }
}
