import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_weather/data/my_location.dart';
import 'package:flutter_weather/data/network.dart';
import 'package:flutter_weather/screens/weather_screen.dart';

const apikey = '671453abc3e5dbc58306e39dfc08c0d8';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double? longitude2;
  double? latitude2;

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.MyLocationData();
    longitude2 = myLocation.longitude;
    latitude2 = myLocation.latitude;
    Network network = Network(
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude2&lon=$longitude2&appid=$apikey&units=metric&lang=kr',
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude2&lon=$longitude2&appid=$apikey');
    var weatherData = await network.getJsonData();
    var airData = await network.getAirData();
    print(airData);
    print(weatherData);
    print(longitude2);
    print(latitude2);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                WeatherScreen(parseWeatherData: weatherData,parseAirData: airData,)));
  }

  @override
  void initState() {
    super.initState();
    getLocation();
    // fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('local weather'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getLocation();
          },
          child: Text('getLocation'),
        ),
      ),
    );
  }
}
