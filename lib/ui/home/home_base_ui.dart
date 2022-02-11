import 'package:flutter/cupertino.dart';
import 'package:weather/ui/home/weather_details.dart';

import '../../services/get_background_icons.dart';
import 'current_weather_data.dart';
import 'hourly_forecast.dart';

class HomeBaseUi extends StatelessWidget {
  // final homeProvider ;
  final currentData;

  final dayData;

  final sunRise;

  final sunSet;

  final hoursList;

  const HomeBaseUi(
      {Key? key,
      required this.currentData,
      required this.dayData,
      required this.sunRise,
      required this.sunSet,
      required this.hoursList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 150.0, left: 16.0, right: 16.0),
            child: CurrentWeatherData(
              temp: currentData?.tempC?.toInt().toString() ?? 'N/A',
              maxTemp: dayData?.maxtempC?.toInt().toString() ?? 'N/A',
              minTemp: dayData?.mintempC?.toInt().toString() ?? 'N/A',
              condition: currentData?.condition?.text ?? 'N/A',
              willRain: dayData?.dailyWillItRain ?? 0,
              willSnow: dayData?.dailyWillItSnow ?? 0,
              feelsLike: currentData?.feelslikeC?.toInt().toString() ?? '',
              textColor: textColor(sunRise: sunRise, sunSet: sunSet),
            )),
        Row(
          children: [
            Expanded(
              child: HourlyForecast(
                hoursList: hoursList,
                textColor: textColor(sunRise: sunRise, sunSet: sunSet),
                sunRise: sunRise,
                sunSet: sunSet,
              ),
            ),
          ],
        ),
        WeatherDetails(
          humidity: currentData?.humidity.toString() ?? '',
          precipitation: currentData?.precipIn.toString() ?? '',
          pressure: currentData?.pressureIn.toString() ?? '',
          uv: currentData?.uv.toString() ?? '',
          visibility: currentData?.visKm.toString() ?? '',
          wind: currentData?.windKph.toString() ?? '',
          textColor: textColor(sunRise: sunRise, sunSet: sunSet),
        )
      ],
    );
  }
}
