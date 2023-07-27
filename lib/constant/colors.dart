import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors extends ColorScheme {
  
  static const ColorScheme lightColorScheme =  ColorScheme(
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
  static  ColorScheme darkColorScheme =  ColorScheme(
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
  
  static final light = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
  );



  static const darkThemeFirstColor = Color(0xFF27374D);
  const AppColors({required super.brightness, required super.primary, required super.onPrimary, required super.secondary, required super.onSecondary, required super.error, required super.onError, required super.background, required super.onBackground, required super.surface, required super.onSurface});
  static Color get mainColor =>Get.isDarkMode ? darkThemeFirstColor : Colors.white;
  static const Color bluishClr = Color(0xFF4e5ae8);
  static const Color yellowClr = Color(0xFFFFB746);
  static const Color pinkClr = Color(0xFFff4667);
  static const Color white = Colors.white;
  static const Color darkGreyClr = Color(0xFF121212);
  static const Color darkHeaderClr = Color(0xFF424242);
  static const Color blueColor = Colors.blue;
  static Color get greyColor =>Get.isDarkMode ? Colors.black : const Color.fromARGB(255, 45, 45, 54);











  




}
