import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherDetails extends StatelessWidget {
  final String precipitation;
  final String humidity;
  final String uv;
  final String wind;
  final String visibility;
  final String pressure;
  final Color textColor;

  const WeatherDetails(
      {Key? key,
      required this.humidity,
      required this.precipitation,
      required this.pressure,
      required this.uv,
      required this.visibility,
      required this.wind,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: textColor == Colors.black
                      ? Color(0x99fea597)
                      : Color(0x994c8bf5),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16.0),
                      bottomLeft: Radius.circular(16.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Details',
                    style: GoogleFonts.barlowCondensed(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: textColor),
                  ),
                  SizedBox.fromSize(
                    size: Size(16, 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(left: 16),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Precipitation',
                                    style: GoogleFonts.barlowCondensed(
                                        color: textColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  SizedBox.fromSize(
                                    size: Size(16, 16),
                                  ),
                                  Text(
                                    '$precipitation in',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: textColor),
                                  ),
                                  SizedBox.fromSize(
                                    size: Size(16, 16),
                                  ),
                                  Text('HUM',
                                      style: GoogleFonts.barlowCondensed(
                                          color: textColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16)),
                                  SizedBox.fromSize(
                                    size: Size(16, 16),
                                  ),
                                  Text(
                                    '$humidity %',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: textColor),
                                  ),
                                  SizedBox.fromSize(
                                    size: Size(16, 16),
                                  ),
                                  Text('UV',
                                      style: GoogleFonts.barlowCondensed(
                                          color: textColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16)),
                                  SizedBox.fromSize(
                                    size: Size(16, 16),
                                  ),
                                  Text(
                                    uv,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: textColor),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 16, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                    children: [
                                      Text('Wind',
                                          style: GoogleFonts.barlowCondensed(
                                              color: textColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16)),
                                      SizedBox.fromSize(
                                        size: Size(16, 16),
                                      ),
                                      Text(
                                        wind,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: textColor),
                                      ),
                                      SizedBox.fromSize(
                                        size: Size(16, 16),
                                      ),
                                      Text('Visibility',
                                          style: GoogleFonts.barlowCondensed(
                                              color: textColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16)),
                                      SizedBox.fromSize(
                                        size: Size(16, 16),
                                      ),
                                      Text(
                                        visibility,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: textColor),
                                      ),
                                      SizedBox.fromSize(
                                        size: Size(16, 16),
                                      ),
                                      Text('Pressure',
                                          style: GoogleFonts.barlowCondensed(
                                              color: textColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16)),
                                      SizedBox.fromSize(
                                        size: Size(16, 16),
                                      ),
                                      Text(
                                        pressure,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: textColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )),
        ),
      ],
    );
  }
}
