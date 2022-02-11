import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/services/get_background_icons.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../data/entities/current_location_weather.dart';
import 'hourly_forecast-item.dart';
import 'package:weather/services/filter_hours_list.dart';

class HourlyForecast extends StatelessWidget {
  final List<Hour> hoursList;
  final Color textColor;
  final String sunRise;
  final String sunSet;

  const HourlyForecast(
      {Key? key,
      required this.hoursList,
      required this.textColor,
      required this.sunRise,
      required this.sunSet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Hour> remainingHoursList = remainingHoursOfDay(hoursList);
    return Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: textColor == Colors.black
                ? Color(0x99fea597)
                : Color(0x994c8bf5),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hourly Forecast',
                style: GoogleFonts.barlowCondensed(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
            Container(
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hoursList.length,
                  itemBuilder: (context, index) {
                    Hour? hourItem = hoursList[index];
                    return HourlyForecastItem(
                      temp: hourItem.tempC?.toInt() ?? 0,
                      icon: getIcons(
                              sunRise: sunRise,
                              sunSet: sunSet,
                              time: hourItem
                                  .timeEpoch!*1000)[hourItem.condition?.code ?? 0] ??
                          WeatherIcons.na,
                      time: hourItem.timeEpoch ?? 0,
                      textColor: textColor,
                    );
                  }),
            )
          ],
        ));
  }
}
