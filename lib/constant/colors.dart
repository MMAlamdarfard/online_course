import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  static const Color blueColor = Colors.blue;
  
  static Color get  greyColor => Get.isDarkMode?Colors.black: const Color(0xFFB8B8D2);
}
