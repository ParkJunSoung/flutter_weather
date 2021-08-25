import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_weather/data/my_location.dart';
import 'package:flutter_weather/data/network.dart';


const apikey = '671453abc3e5dbc58306e39dfc08c0d8';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double? longitude2;
  double? latitude2;
  //사용자 동의 구하고 위치 좌표 받아오기

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.MyLocationData();
    longitude2 = myLocation.longitude;
    latitude2 = myLocation.latitude;
    Network network = Network('https://api.openweathermap.org/data/2.5/weather?lat=$latitude2&lon=$longitude2&appid=$apikey');
    var weatherData = await network.getJsonData();
    print(weatherData);
  }

  // void fetchData() async {
  //
  //     var myJson = parsingData['weather'][0]['description'];
  //     print(myJson);
  //   }
  // }

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
        title: Text('날씨'),
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
