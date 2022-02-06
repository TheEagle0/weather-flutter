import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class HourlyForecastItem extends StatelessWidget {
  final int? time;
  final String? iconUrl;
  final int? temp;

  String formattedTime(int timeInMillis) {
    String formattedTime = DateFormat('h a')
        .format(DateTime.fromMillisecondsSinceEpoch(timeInMillis * 1000));
    return formattedTime;
  }

  HourlyForecastItem(
      {Key? key,
      @required this.time,
      @required this.iconUrl,
      @required this.temp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 16,
          ),
          Text(formattedTime(time ?? 0)),
          Container(width: 50,height: 50,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
              Uri.parse('https:$iconUrl').toString(),
            ))),
          ),
          Text(temp?.toString() ?? 'N/A')
        ],
      ),
    );
  }
}
