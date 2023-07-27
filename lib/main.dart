import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:onlinecourse/constant/colors.dart';
import 'package:onlinecourse/routes/routes.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:onlinecourse/services/theme_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppColors.light,
      darkTheme: AppColors.dark,
      themeMode: ThemeService().theme,
      getPages: routes,
    );
  }
}
