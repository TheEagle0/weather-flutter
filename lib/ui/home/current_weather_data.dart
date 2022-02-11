import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/ui/home/rain_snow_feels_item.dart';
import 'package:weather_icons/weather_icons.dart';

class CurrentWeatherData extends StatelessWidget {
  final String temp;
  final String condition;
  final String maxTemp;
  final String minTemp;
  final int willRain;
  final int willSnow;
  final String feelsLike;
  final Color textColor;

  CurrentWeatherData(
      {Key? key,
      required this.temp,
      required this.condition,
      required this.maxTemp,
      required this.minTemp,
      required this.willRain,
      required this.willSnow,
      required this.feelsLike,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(
                  temp,
                  style: GoogleFonts.barlowCondensed(
                      fontWeight: FontWeight.w600,
                      fontSize: 110.0,
                      color: textColor),
                ),
                Text(
                  condition,
                  style: GoogleFonts.barlowCondensed(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w600,
                      color: textColor),
                  maxLines: 1,
                ),
                Row(
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      WidgetSpan(
                          child: Icon(
                        Icons.arrow_upward,
                        size: 20.0,
                        color: textColor,
                      )),
                      TextSpan(
                        text: maxTemp,
                        style: GoogleFonts.barlowCondensed(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ])),
                    SizedBox.fromSize(
                      size: Size(24.0, 24.0),
                    ),
                    RichText(
                        text: TextSpan(children: [
                      WidgetSpan(
                          child: Icon(
                        Icons.arrow_downward,
                        size: 20.0,
                        color: textColor,
                      )),
                      TextSpan(
                          text: minTemp,
                          style: GoogleFonts.barlowCondensed(
                              color: textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 20)),
                    ]))
                  ],
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            )),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RainSnowFeels(
                text: willSnow > 0
                    ? '${willSnow.toString()}%'
                    : '${willRain.toString()}%',
                icon: willSnow > 0 ? WeatherIcons.snow : WeatherIcons.rain),
            SizedBox.fromSize(
              size: Size(24.0, 8.0),
            ),
            RainSnowFeels(text: feelsLike, icon: WeatherIcons.thermometer),
          ],
        ))
      ],
    );
  }
}
