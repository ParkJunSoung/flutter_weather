import 'package:flutter/material.dart';
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
  Model model = Model();
  String? cityName;
  String? country;
  double? temp;
  int? temp2;
  Widget? icon;
  Widget? air;
  DateTime time = DateTime.now();
  double? pm10;
  double? pm2_5;
  String? timedate;
  int? humidity;
  num? wind;
  int? clouds;

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
    humidity = weatherData['main']['humidity'];
    wind = weatherData['wind']['speed'];
    clouds = weatherData['clouds']['all'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          children: [
            SizedBox(
              width: 55,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.brown,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 200,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.brown,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    '$cityName',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text('$timedate'),
                  Text(
                    '${temp2}℃',
                    style: TextStyle(fontSize: 70),
                  ),
                  Container(width: 50, height: 80, child: icon),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '풍속',
                            style: TextStyle(fontSize: 17),
                          ),
                          Text('     습도', style: TextStyle(fontSize: 17)),
                          Text('구름', style: TextStyle(fontSize: 17)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '${wind}m/s',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text('${humidity}%',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                          Text('${clouds}%',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(150),
                      topRight: Radius.circular(150),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.brown[200]),
              width: 300,
              height: 350,
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'AIQ(대기질지수)',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    child: air,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '미세먼지',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text('(pm10)', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    '$pm10',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'μg/m 3',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '초미세먼지',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text('(pm2_5)',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    '$pm2_5',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text('μg/m 3', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
