import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/services/get_background.dart';
import 'package:weather/ui/home/home_base_ui.dart';
import 'package:weather/ui/home/home_provider.dart';

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
          final isLoading = homeProvider.isLoading;
          final hoursList =
              homeProvider.weatherData?.forecast?.forecastday?[0].hour ??
                  List.empty();
          return Scaffold(
            // backgroundColor: Colors.teal.shade100,
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
                    child: isLoading
                        ? Center(
                          child: Container(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          ),
                        )
                        : HomeBaseUi(
                        currentData: currentData,
                        dayData: dayData,
                        sunRise: sunRise,
                        sunSet: sunSet,
                        hoursList: hoursList)
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
