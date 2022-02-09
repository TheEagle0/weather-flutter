import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/entities/current_location_weather.dart';
import 'hourly_forecast-item.dart';
import 'package:weather/services/filter_hours_list.dart';

class HourlyForecast extends StatelessWidget {
  final List<Hour> hoursList;
  final Color textColor;

  const HourlyForecast(
      {Key? key, required this.hoursList, required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Hour> currentList = remainingHoursOfDay(hoursList);
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
              height: 110,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: currentList.length,
                  itemBuilder: (context, index) {
                    Hour? hourItem = currentList[index];
                    return HourlyForecastItem(
                      temp: hourItem.tempC?.toInt() ?? 0,
                      iconUrl: hourItem.condition?.icon ?? '',
                      time: hourItem.timeEpoch ?? 0,
                      textColor: textColor,
                    );
                  }),
            )
          ],
        ));
  }
}
