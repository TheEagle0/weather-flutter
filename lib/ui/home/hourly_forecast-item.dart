import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HourlyForecastItem extends StatelessWidget {
  final int time;
  final IconData icon;
  final int temp;
  final Color textColor;

  String formattedTime(int timeInMillis) {
    String formattedTime = DateFormat('h a')
        .format(DateTime.fromMillisecondsSinceEpoch(timeInMillis * 1000));
    return formattedTime;
  }

  HourlyForecastItem(
      {Key? key,
      required this.time,
      required this.icon,
      required this.temp,
      required this.textColor,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 16,
          ),
          Text(formattedTime(time),
              style:
                  GoogleFonts.barlowCondensed(color: textColor, fontSize: 17,fontWeight: FontWeight.w600)),
          Container(
            margin: EdgeInsets.only(top: 4, bottom: 4),
            width: 50,
            height: 50,
            child: Icon(
              icon,
              color: textColor,
            ),
          ),
          Text(
            temp.toString(),
            style: GoogleFonts.barlowCondensed(
                color: textColor, fontSize: 17,fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
