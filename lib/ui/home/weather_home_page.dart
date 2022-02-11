import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather/services/get_background_icons.dart';
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
                      image: AssetImage(background(isDay: currentData?.isDay)),
                      fit: BoxFit.cover)),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    snap: true,
                    floating: true,
                    pinned: true,
                    elevation: 0,
                    leading: null,
                    backgroundColor: Colors.transparent,
                    expandedHeight: 100.0,
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: EdgeInsets.only(left: 24, bottom: 16),
                      title: Text(
                          homeProvider.weatherData?.location?.name ?? 'Weather',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.barlowCondensed(
                              color:
                                  textColor(sunRise: sunRise, sunSet: sunSet),
                              fontWeight: FontWeight.w600,
                              fontSize: 36)),
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
                              hoursList: hoursList))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
