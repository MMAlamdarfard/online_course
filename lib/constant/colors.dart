import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  static const Color bluishClr = Color(0xFF4e5ae8);
  static const Color yellowClr = Color(0xFFFFB746);
  static const Color pinkClr = Color(0xFFff4667);
  static const Color white = Colors.white;
  static const Color darkGreyClr =  Color(0xFF121212);
  static const Color darkHeaderClr = Color(0xFF424242);
  static const Color blueColor = Colors.blue;
  static Color get  greyColor =>  const Color(0xFFB8B8D2);
  static final light = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}



