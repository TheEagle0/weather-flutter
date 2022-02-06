import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/ui/home/home_provider.dart';
import 'package:weather/ui/home/weather_home_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: WeatherHomePage(),
    );
  }
}
