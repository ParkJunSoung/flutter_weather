import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Model{
  Widget? getWeatherIcon(int condition){
    // 뇌우
    if(condition <=200){
      return SvgPicture.asset('sgv/Cloud-Lightning.sgv',
      color: Colors.black);
    } else if(condition <=300) {
      // 이슬비
      return SvgPicture.asset('sgv/Cloud-Lightning.sgv',
        color: Colors.black);
    } else if(condition <=500) {
      // 비
      return SvgPicture.asset('sgv/Cloud-Lightning.sgv',
        color: Colors.black);
    } else if(condition <=600) {
      //눈
      return SvgPicture.asset('sgv/Cloud-Lightning.sgv',
      color: Colors.black);
    } else if(condition <=700) {
      //먼지 안개
      return SvgPicture.asset('sgv/Cloud-Lightning.sgv',
      color: Colors.black);
    } else if(condition < 800) {
      //구름
      return SvgPicture.asset('sgv/Cloud-Lightning.sgv',
      color: Colors.black);
    }else if(condition == 800) {
      //햇살
      return SvgPicture.asset('sgv/Sun.svg',
        color: Colors.black);
    }

  }
}