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
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.brown[200],
        title: Text(
          '우리동네 날씨',
          style: TextStyle(color: Colors.grey[100],fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Positioned(
                  top: 45,
                  left: -0.5,
                  child: Container(
                    height: 47,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.brown),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: BorderSide(color: Colors.white)),
                        ),
                      ),
                      onPressed: () {
                        getLocation();
                      },
                      child: Text(
                        '우리동네 날씨 보기',
                        style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    height: 300.0,
                    width: 310.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('image/b.png'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
