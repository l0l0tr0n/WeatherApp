import 'package:flutter/material.dart';
import 'requests.dart';
import 'weather.dart';

void main(){
  runApp(MyApp());
  test();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Text('h'),
        ),
      ),
    );
  }
}

void test() async{
  String a = await WeatherRequest().getWeather();
  print(a);
}
