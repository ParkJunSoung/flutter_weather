import 'package:flutter/material.dart';
import 'package:flutter_weather/model/model.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData});

  final parseWeatherData;

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

  @override
  void initState() {
    super.initState();
    updataData(widget.parseWeatherData);
  }

  void updataData(dynamic weatherData) {
    temp = weatherData['main']['temp'];
    temp2 = temp!.round();
    int condition = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];
    icon = model.getWeatherIcon(condition);
    print(condition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$cityName'),
            SizedBox(
              height: 20,
            ),
            Text(
              '${temp2}℃',
              style: TextStyle(color: Colors.white, fontSize: 60),
            ),
            Text('$icon'),
          ],
        ),
      ),
    );
  }
}
