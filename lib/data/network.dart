import 'dart:convert';
import 'package:http/http.dart' as http;

class Network {
  final String url;
  final String url2;

  Network(this.url, this.url2);

  Future<dynamic> getJsonData() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }

  Future<dynamic> getAirData() async {
    var response = await http.get(url2);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
}
