import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyLocation {
  double? longitude;
  double? latitude;
  Future<void> MyLocationData() async{
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch(e) {
      Text('인터넷이 불안정 합니다.');
    }
  }
}