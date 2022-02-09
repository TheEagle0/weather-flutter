import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/services/get_background.dart';
import 'package:weather/ui/home/home_provider.dart';
import 'package:weather/ui/home/current_weather_data.dart';
import 'package:weather/ui/home/hourly_forecast.dart';
import 'package:weather/ui/home/weather_details.dart';

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: Builder(
        builder: (context) {
          final homeProvider = context.watch<HomeProvider>();
          final currentData = homeProvider.weatherData?.current;
          final dayData =
              homeProvider.weatherData?.forecast?.forecastday?[0].day;
          final sunRise = homeProvider
                  .weatherData?.forecast?.forecastday?[0].astro?.sunrise ??
              '';
          final sunSet = homeProvider
                  .weatherData?.forecast?.forecastday?[0].astro?.sunset ??
              '';
          return Scaffold(
            backgroundColor: Colors.teal.shade100,
            extendBodyBehindAppBar: true,
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          background(sunRise: sunRise, sunSet: sunSet)),
                      fit: BoxFit.cover)),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    snap: true,
                    floating: true,
                    pinned: true,
                    backgroundColor: Colors.transparent,
                    expandedHeight: 100.0,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        homeProvider.weatherData?.location?.name ?? 'Weather',
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 150.0, left: 16.0, right: 16.0),
                            child: CurrentWeatherData(
                              temp: currentData?.tempC?.toInt().toString() ??
                                  'N/A',
                              maxTemp: dayData?.maxtempC?.toInt().toString() ??
                                  'N/A',
                              minTemp: dayData?.mintempC?.toInt().toString() ??
                                  'N/A',
                              condition: dayData?.condition?.text ?? 'N/A',
                              willRain: dayData?.dailyWillItRain ?? 0,
                              willSnow: dayData?.dailyWillItSnow ?? 0,
                              feelsLike:
                                  currentData?.feelslikeC?.toInt().toString() ??
                                      '',
                              textColor:
                                  textColor(sunRise: sunRise, sunSet: sunSet),
                            )),
                        Row(
                          children: [
                            Expanded(
                              child: HourlyForecast(
                                hoursList: homeProvider.weatherData?.forecast
                                        ?.forecastday?[0].hour ??
                                    List.empty(),
                                textColor:
                                    textColor(sunRise: sunRise, sunSet: sunSet),
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
                          textColor:
                              textColor(sunRise: sunRise, sunSet: sunSet),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
