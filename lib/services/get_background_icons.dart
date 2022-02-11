import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/services/state_icon.dart';

int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;

DateTime now = DateTime.now();

String background({int? isDay}) {
  if (isDay != null) {
    if (isDay == 1) {
      print('day');
      return 'images/sunset.jpeg';
    } else {
      print('night');

      return 'images/night.jpg';
    }
  } else
    return 'images/background.png';
}

Map<int, IconData> getIcons({String? sunRise, String? sunSet,int? time}) {
  if (sunRise != null) {
    if (time!.isBetween(parseTime(sunRise), parseTime(sunSet!))) {
      return dayStatesMap;
    } else {
      return nightStatesMap;
    }
  } else
    return dayStatesMap;
}

Color textColor({String sunRise = '', String sunSet = ''}) {
  if (sunRise.isNotEmpty) {
    if (currentTimeInMillis.isBetween(parseTime(sunRise), parseTime(sunSet))) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  } else
    return Colors.white;
}

int parseTime(String time) {
  final format = DateFormat("HH:mm aa");
  TimeOfDay tod = TimeOfDay.fromDateTime(format.parse(time));
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day, tod.hour, tod.minute)
      .millisecondsSinceEpoch;
}

extension Range on num {
  bool isBetween(num from, num to) {
    return from < this && this < to;
  }
}
