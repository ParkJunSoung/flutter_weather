import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather/model/model.dart';
import 'package:intl/intl.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData, this.parseAirData});

  final parseWeatherData;
  final parseAirData;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? cityName;
  String? country;
  double? temp;
  int? temp2;
  Widget? icon;
  Model model = Model();
  Widget? air;
  DateTime time = DateTime.now();
  double? pm10;
  double? pm2_5;
  String? timedate;

  @override
  void initState() {
    super.initState();
    updataData(widget.parseWeatherData, widget.parseAirData);
  }

  void updataData(dynamic weatherData, dynamic airData) {
    temp = weatherData['main']['temp'];
    temp2 = temp!.round();
    int condition = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];
    icon = model.getWeatherIcon(condition);
    var index = airData['list'][0]['main']['aqi'];
    pm2_5 = airData['list'][0]['components']['pm2_5'];
    pm10 = airData['list'][0]['components']['pm10'];
    air = model.getAirIcon(index);
    timedate = DateFormat.yMMMd('en_US').format(time);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          '$cityName',
          style: TextStyle(fontSize: 25),
        ),
        Text('$timedate'),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 30,
        ),
        Text(
          '${temp2}℃',
          style: TextStyle(fontSize: 70),
        ),
        Container(
          height: 1,
          width: 350,
          color: Colors.black,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Air Pollut',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  child: air,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Air Pollution',
                  style: TextStyle(fontSize: 17),
                ),
                Text('(pm10)'),
                Text(
                  '$pm10',
                  style: TextStyle(fontSize: 30),
                ),
                Text('μg/m 3'),
              ],
            ),
            Column(
              children: [
                Text(
                  'Air Pollution',
                  style: TextStyle(fontSize: 17),
                ),
                Text('(pm2_5)'),
                Text(
                  '$pm2_5',
                  style: TextStyle(fontSize: 30),
                ),
                Text('μg/m 3'),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
