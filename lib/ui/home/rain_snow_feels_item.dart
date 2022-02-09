import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class RainSnowFeels extends StatelessWidget {
  final String text;
  final IconData icon;

  const RainSnowFeels({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 36,
      decoration: BoxDecoration(
          color: Color(0x50000000),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Padding(
          padding: EdgeInsets.fromLTRB(4, 0, 10, 0),
          child: Row(
            children: [
              Expanded(
                child: BoxedIcon(
                  icon,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Text('$text',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    )),
              )
            ],
          )),
    );
  }
}
