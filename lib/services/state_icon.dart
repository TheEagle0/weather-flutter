import 'package:flutter/cupertino.dart';
import 'package:weather_icons/weather_icons.dart';

Map<int, IconData> dayStatesMap = {
  1000: WeatherIcons.day_sunny,
  1003: WeatherIcons.day_cloudy,
  1006: WeatherIcons.day_cloudy_high,
  1009: WeatherIcons.day_sunny_overcast,
  1030: WeatherIcons.day_haze,
  1063: WeatherIcons.day_sprinkle,
  1066: WeatherIcons.day_snow,
  1069: WeatherIcons.day_sleet,
  1072: WeatherIcons.day_sprinkle,
  1087: WeatherIcons.day_thunderstorm,
  1114: WeatherIcons.day_snow_wind,
  1117: WeatherIcons.day_snow,
  1135: WeatherIcons.day_fog,
  1147: WeatherIcons.day_haze,
  1150: WeatherIcons.day_sprinkle,
  1153: WeatherIcons.day_sleet,
  1168: WeatherIcons.day_sprinkle,
  1171: WeatherIcons.day_sleet_storm,
  1180: WeatherIcons.day_sprinkle,
  1183: WeatherIcons.day_rain,
  1186: WeatherIcons.day_rain,
  1189: WeatherIcons.day_rain,
  1192: WeatherIcons.day_showers,
  1195: WeatherIcons.day_showers,
  1198: WeatherIcons.sleet,
  1201: WeatherIcons.day_showers,
  1204: WeatherIcons.day_sleet,
  1207: WeatherIcons.day_sleet_storm,
  1210: WeatherIcons.day_snow,
  1213: WeatherIcons.day_snow,
  1216: WeatherIcons.day_snow,
  1219: WeatherIcons.day_snow,
  1222: WeatherIcons.day_snow,
  1225: WeatherIcons.day_snow,
  1237: WeatherIcons.day_snow,
  1240: WeatherIcons.day_showers,
  1243: WeatherIcons.day_showers,
  1246: WeatherIcons.day_showers,
  1249: WeatherIcons.day_sleet,
  1252: WeatherIcons.day_snow,
  1255: WeatherIcons.day_snow,
  1258: WeatherIcons.day_snow,
  1261: WeatherIcons.snowflake_cold,
  1264: WeatherIcons.day_snow,
  1273: WeatherIcons.day_thunderstorm,
  1276: WeatherIcons.day_thunderstorm,
  1279: WeatherIcons.day_snow_thunderstorm,
  1282: WeatherIcons.day_snow_thunderstorm
};
Map<int, IconData> nightStatesMap = {
  1000: WeatherIcons.night_clear,
  1003: WeatherIcons.night_cloudy,
  1006: WeatherIcons.night_cloudy_high,
  1009: WeatherIcons.night_clear,
  1030: WeatherIcons.night_fog,
  1063: WeatherIcons.night_sprinkle,
  1066: WeatherIcons.night_snow,
  1069: WeatherIcons.night_sleet,
  1072: WeatherIcons.night_sprinkle,
  1087: WeatherIcons.night_thunderstorm,
  1114: WeatherIcons.night_snow_wind,
  1117: WeatherIcons.night_snow,
  1135: WeatherIcons.night_fog,
  1147: WeatherIcons.night_fog,
  1150: WeatherIcons.night_sprinkle,
  1153: WeatherIcons.night_sleet,
  1168: WeatherIcons.night_sprinkle,
  1171: WeatherIcons.night_sleet_storm,
  1180: WeatherIcons.night_sprinkle,
  1183: WeatherIcons.night_rain,
  1186: WeatherIcons.night_rain,
  1189: WeatherIcons.night_rain,
  1192: WeatherIcons.night_showers,
  1195: WeatherIcons.night_showers,
  1198: WeatherIcons.sleet,
  1201: WeatherIcons.night_showers,
  1204: WeatherIcons.night_sleet,
  1207: WeatherIcons.night_sleet_storm,
  1210: WeatherIcons.night_snow,
  1213: WeatherIcons.night_snow,
  1216: WeatherIcons.night_snow,
  1219: WeatherIcons.night_snow,
  1222: WeatherIcons.night_snow,
  1225: WeatherIcons.night_snow,
  1237: WeatherIcons.night_snow,
  1240: WeatherIcons.night_showers,
  1243: WeatherIcons.night_showers,
  1246: WeatherIcons.night_showers,
  1249: WeatherIcons.night_sleet,
  1252: WeatherIcons.night_snow,
  1255: WeatherIcons.night_snow,
  1258: WeatherIcons.night_snow,
  1261: WeatherIcons.snowflake_cold,
  1264: WeatherIcons.night_snow,
  1273: WeatherIcons.night_thunderstorm,
  1276: WeatherIcons.night_thunderstorm,
  1279: WeatherIcons.night_snow_thunderstorm,
  1282: WeatherIcons.night_snow_thunderstorm
};