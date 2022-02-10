import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

int currentTimeInSeconds = DateTime.now().millisecondsSinceEpoch;

DateTime now = DateTime.now();

String background({String sunRise = '', String sunSet = ''}) {
  if (sunSet.isNotEmpty) {
    if (currentTimeInSeconds.isBetween(parseTime(sunRise), parseTime(sunSet))) {
      print('day');
      return 'images/sunset.jpeg';
    } else {
      print('night');

      return 'images/night.jpg';
    }
  } else
    return 'images/background.png';
}

Color textColor({String sunRise = '', String sunSet = ''}) {
  if (currentTimeInSeconds.isBetween(parseTime(sunRise), parseTime(sunSet))) {
    return Colors.black;
  } else {
    return Colors.white;
  }
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


