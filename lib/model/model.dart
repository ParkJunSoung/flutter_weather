import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Model {
  Widget? getWeatherIcon(int condition) {
    // 뇌우
    if (condition > 200) {
      return SvgPicture.asset('sgv/Cloud-Lightning.svg', color: Colors.black);
    } else if (condition > 300) {
      // 이슬비
      return SvgPicture.asset('sgv/Cloud-Rain-Alt.svg', color: Colors.black);
    } else if (condition > 500) {
      // 비
      return SvgPicture.asset('sgv/Cloud-Rain.svg', color: Colors.black);
    } else if (condition > 600) {
      //눈
      return SvgPicture.asset('sgv/Cloud-Snow.svg', color: Colors.black);
    } else if (condition > 700) {
      //먼지 안개
      return SvgPicture.asset('sgv/Cloud-Fog-Alt.svg', color: Colors.black);
    } else if (condition > 800) {
      //구름
      return SvgPicture.asset('sgv/Cloud.svg', color: Colors.black);
    } else if (condition == 800) {
      //햇살
      return SvgPicture.asset('sgv/Sun.svg', color: Colors.black);
    }
  }

  Widget? getAirIcon(int index) {
    if (index == 1) {
      return Column(
        children: [
          Text('😀',style: TextStyle(fontSize: 50),),
          Text('Good'),
        ],
      );
    } else if (index == 2) {
      return Column(
        children: [
          Text('🙂',style: TextStyle(fontSize: 50),),
          Text('Normal'),
        ],
      );
    } else if (index == 3) {
      return Column(
        children: [
          Text('🙂',style: TextStyle(fontSize: 50),),
          Text('Normal'),
        ],
      );
    } else if (index == 4) {
      return Column(
        children: [
          Text('🤐',style: TextStyle(fontSize: 50),),
          Text('Bad'),
        ],
      );
    } else if (index == 5) {
      return Column(
        children: [
          Text('😷',style: TextStyle(fontSize: 50)),
          Text('Very Bad'),
        ],
      );
    }
  }
}
