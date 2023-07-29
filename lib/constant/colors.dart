import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  static final light = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
  );
  static Brightness get statusBarBrightness =>
      Get.isDarkMode ? Brightness.dark : Brightness.light;
  static Color get appBarColor =>
      Get.isDarkMode ? Colors.white : const Color(0xFF292929);
  static Color get statusBarIconColor =>
      Get.isDarkMode ? Colors.black : Colors.white;
  static Color get backgroundColor =>
      Get.isDarkMode ? Colors.white : const Color(0xFF333333);
  //Can Change this color
  static Color get bottomNavigaitonBarSelectedColor =>
      Get.isDarkMode ? Colors.blue :Colors.blue;
  static Color get bottomNavigaitonBarUnselectedColor =>
      Get.isDarkMode ?const Color(0xFF424242).withOpacity(0.4) : Colors.white;
  static Color get mainTextColor =>
      Get.isDarkMode ?  Colors.black:Colors.white ;
  static Color get indicatorSelectedColor =>
      Get.isDarkMode ? Colors.black : Colors.white;
















 static const darkThemeFirstColor = Color(0xFF27374D);
  static Color get mainColor =>
      Get.isDarkMode ? darkThemeFirstColor : Colors.white;
  static const Color bluishClr = Color(0xFF4e5ae8);
  static const Color yellowClr = Color(0xFFFFB746);
  static const Color pinkClr = Color(0xFFff4667);
  static const Color white = Colors.white;
  static const Color darkGreyClr = Color(0xFF121212);
  static const Color darkHeaderClr = Color(0xFF424242);
  static const Color blueColor = Colors.blue;
  static Color get greyColor => Get.isDarkMode ? Colors.black : Colors.white;
  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFFFFFFF),
    secondary: Colors.black,
    background: Color(0xFF636363),
    surface: Color(0xFF808080),
    onBackground: Colors.white,
    error: Colors.redAccent,
    onError: Colors.redAccent,
    onPrimary: Colors.redAccent,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.dark,
  );
  static ColorScheme darkColorScheme = ColorScheme(
    primary: const Color(0xFF333333), // <---- I set white color here
    secondary: Colors.white.withOpacity(0.95),
    background: const Color(0xFF636363),
    surface: const Color(0xFF808080),
    onBackground: Colors.white,
    error: Colors.redAccent,
    onError: Colors.redAccent,
    onPrimary: Colors.redAccent,
    onSecondary: const Color(0xFF322942),
    onSurface: const Color(0xFF241E30),
    brightness: Brightness.light,
  );
}
