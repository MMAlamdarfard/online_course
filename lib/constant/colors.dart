import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  static const darkThemeFirstColor = Color(0xFF27374D);

  static Color get mainColor =>Get.isDarkMode ? darkThemeFirstColor : Colors.white;





  static const Color bluishClr = Color(0xFF4e5ae8);
  static const Color yellowClr = Color(0xFFFFB746);
  static const Color pinkClr = Color(0xFFff4667);
  static const Color white = Colors.white;
  static const Color darkGreyClr = Color(0xFF121212);
  static const Color darkHeaderClr = Color(0xFF424242);
  static const Color blueColor = Colors.blue;
  static Color get greyColor =>
      Get.isDarkMode ? Colors.black : Color.fromARGB(255, 45, 45, 54);

  static final light = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}
