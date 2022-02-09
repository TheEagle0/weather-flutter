import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

int currentTimeInSeconds = (DateTime.now().millisecondsSinceEpoch) ~/ 1000;
DateTime now = DateTime.now();

String background({String sunRise = '', String sunSet = ''}) {
  if (currentTimeInSeconds.isBetween(parseTime(sunRise), parseTime(sunSet))) {
    print('day');
    return 'images/sunset.jpeg';
  } else {
    print('night');

    return 'images/night.jpg';
  }
}
Color textColor({String sunRise = '', String sunSet = ''}) {
  if (currentTimeInSeconds.isBetween(parseTime(sunRise), parseTime(sunSet))) {
    print('day');
    return Colors.black;
  } else {
    print('night');

    return Colors.white;
  }
}

int parseTime(String time) {
  if (time.isNotEmpty) {
    final format = DateFormat.jm();
    TimeOfDay tod = TimeOfDay.fromDateTime(format.parse(time));
    return DateTime(now.year, now.month, now.day, tod.hour, tod.minute).second;
  } else
    return 0;
}

extension Range on num {
  bool isBetween(num from, num to) {
    return from < this && this < to;
  }
}
