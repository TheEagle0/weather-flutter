import 'package:weather/data/entities/current_location_weather.dart';

  int currentTimeInSeconds = (DateTime.now().millisecondsSinceEpoch) ~/ 1000;

  List<Hour> remainingHoursOfDay(List<Hour> hours){
    return hours.where((hour) => hour.timeEpoch!+3600 >= currentTimeInSeconds).toList();
  }

