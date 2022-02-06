import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weather/data/entities/current_location_weather.dart';
import 'package:weather/ui/home/home_provider.dart';
import 'package:weather/ui/home/hourly_forecast-item.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: Builder(
        builder: (context) {
          final homeProvider = context.watch<HomeProvider>();
          return Scaffold(
            backgroundColor: Colors.teal.shade100,
            extendBodyBehindAppBar: true,
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/sunset.jpeg'),
                      fit: BoxFit.cover)),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    snap: true,
                    floating: true,
                    pinned: true,
                    backgroundColor: Colors.transparent,
                    expandedHeight: 130.0,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(homeProvider.weatherData?.location?.name ??
                          'Weather'),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 150.0, left: 16.0, right: 16.0),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 5,
                                  child: Column(
                                    children: [
                                      Text(
                                        homeProvider.weatherData?.current?.tempC
                                                ?.toInt()
                                                .toString() ??
                                            'N/A',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 70.0,
                                        ),
                                      ),
                                      Text(
                                        homeProvider.weatherData?.current
                                                ?.condition?.text ??
                                            'N/A',
                                        style: TextStyle(
                                          fontSize: 40.0,
                                          fontWeight: FontWeight.w400,
                                        ),
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
                                            )),
                                            TextSpan(
                                                text: homeProvider
                                                        .weatherData
                                                        ?.forecast
                                                        ?.forecastday?[0]
                                                        .day
                                                        ?.maxtempC
                                                        ?.toInt()
                                                        .toString() ??
                                                    'N/A',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                )),
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
                                            )),
                                            TextSpan(
                                                text: homeProvider
                                                        .weatherData
                                                        ?.forecast
                                                        ?.forecastday?[0]
                                                        .day
                                                        ?.mintempC
                                                        ?.toInt()
                                                        .toString() ??
                                                    'N/A',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                )),
                                          ]))
                                        ],
                                      )
                                    ],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  )),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    width:80,
                                    decoration: BoxDecoration(
                                        color: Color(0x50000000),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16))),
                                    child: Padding(padding: EdgeInsets.fromLTRB(4, 0, 10, 0),
                                      child:
                                      RichText(
                                          text: TextSpan(children: [
                                            WidgetSpan(alignment: PlaceholderAlignment.middle,
                                                child: BoxedIcon(
                                                  WeatherIcons.raindrops,
                                                  size: 26,
                                                  color: Colors.white,
                                                )),
                                            TextSpan(
                                                text: homeProvider
                                                    .weatherData
                                                    ?.forecast
                                                    ?.forecastday?[0]
                                                    .day
                                                    ?.dailyWillItRain
                                                    .toString() ??
                                                    'N/A',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                    color: Colors.white,
                                                )),
                                          ])),

                                    ),
                                  ),
                                  SizedBox.fromSize(
                                    size: Size(24.0, 8.0),
                                  ),
                                  Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Color(0x50000000),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16))),
                                    child: Padding(padding: EdgeInsets.fromLTRB(4, 0, 10, 0),
                                      child:
                                      RichText(
                                          text: TextSpan(children: [
                                            WidgetSpan(alignment: PlaceholderAlignment.middle,
                                                child: BoxedIcon(
                                                  WeatherIcons.degrees,
                                                  size: 26,
                                                  color: Colors.white,
                                                )),
                                            TextSpan(
                                                text: homeProvider
                                                    .weatherData?.current?.feelslikeC
                                                    ?.toInt()
                                                    .toString() ??
                                                    'N/A',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                )),
                                          ])),

                                    ),
                                  ),

                                ],
                              ))
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.all(16.0),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      color: Color(0x99fea597),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16.0),
                                          bottomRight: Radius.circular(16.0))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Hourly Forecast'),
                                      Container(
                                        height: 100,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: homeProvider
                                                    .weatherData
                                                    ?.forecast
                                                    ?.forecastday?[0]
                                                    .hour
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              Hour? hourItem = homeProvider
                                                  .weatherData
                                                  ?.forecast
                                                  ?.forecastday?[0]
                                                  .hour?[index];
                                              return HourlyForecastItem(
                                                temp:
                                                    hourItem?.tempC?.toInt() ??
                                                        0,
                                                iconUrl:
                                                    hourItem?.condition?.icon,
                                                time: hourItem?.timeEpoch ?? 0,
                                              );
                                            }),
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.all(16.0),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      color: Color(0x99fea597),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16.0),
                                          bottomRight: Radius.circular(16.0))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Details',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox.fromSize(
                                        size: Size(16, 16),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text('Precipitation'),
                                                      SizedBox.fromSize(
                                                        size: Size(16, 16),
                                                      ),
                                                      Text(
                                                        '${homeProvider.weatherData?.forecast?.forecastday?[0].hour?[0].precipIn.toString() ?? 0} in',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox.fromSize(
                                                        size: Size(16, 16),
                                                      ),
                                                      Text('HUM'),
                                                      SizedBox.fromSize(
                                                        size: Size(16, 16),
                                                      ),
                                                      Text(
                                                        '${homeProvider.weatherData?.forecast?.forecastday?[0].hour?[0].humidity.toString() ?? 0} %',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox.fromSize(
                                                        size: Size(16, 16),
                                                      ),
                                                      Text('UV'),
                                                      SizedBox.fromSize(
                                                        size: Size(16, 16),
                                                      ),
                                                      Text(
                                                        homeProvider
                                                                .weatherData
                                                                ?.forecast
                                                                ?.forecastday?[
                                                                    0]
                                                                .hour?[0]
                                                                .uv
                                                                .toString() ??
                                                            'N/A',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 0, 16, 0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text('Wind'),
                                                          SizedBox.fromSize(
                                                            size: Size(16, 16),
                                                          ),
                                                          Text(
                                                            homeProvider
                                                                    .weatherData
                                                                    ?.forecast
                                                                    ?.forecastday?[
                                                                        0]
                                                                    .hour?[0]
                                                                    .windKph
                                                                    .toString() ??
                                                                'N/A',
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          SizedBox.fromSize(
                                                            size: Size(16, 16),
                                                          ),
                                                          Text('Visibility'),
                                                          SizedBox.fromSize(
                                                            size: Size(16, 16),
                                                          ),
                                                          Text(
                                                            homeProvider
                                                                    .weatherData
                                                                    ?.forecast
                                                                    ?.forecastday?[
                                                                        0]
                                                                    .hour?[0]
                                                                    .visKm
                                                                    .toString() ??
                                                                'N/A',
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          SizedBox.fromSize(
                                                            size: Size(16, 16),
                                                          ),
                                                          Text('Pressure'),
                                                          SizedBox.fromSize(
                                                            size: Size(16, 16),
                                                          ),
                                                          Text(
                                                            homeProvider
                                                                    .weatherData
                                                                    ?.forecast
                                                                    ?.forecastday?[
                                                                        0]
                                                                    .hour?[0]
                                                                    .pressureIn
                                                                    .toString() ??
                                                                'N/A',
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
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
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
