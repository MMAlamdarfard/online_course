import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlinecourse/screens/main/acountpage.dart';
import 'package:onlinecourse/screens/main/coursepage.dart';
import 'package:onlinecourse/screens/main/messagepage.dart';
import 'package:onlinecourse/screens/main/searchpage.dart';
import 'package:onlinecourse/widget/bottom_navigation_bar.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import '../../controller/controller.dart';
import '../../widget/custom_appbar.dart';
import 'homepage.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: context.theme.brightness,
        statusBarColor: Colors.transparent));
    

    final Controller controller = Get.put(Controller());

    return Scaffold(
        body: Stack(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 90, bottom: 80),
            child: Obx(() => _getPage(controller.getIndex()))),
        const Positioned(
          top: 0,
          left: 0,
          child: MyAppBar(),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: SizedBox(
            height: 80,
            child: MyBottomNavigationBar(),
          ),
        ),
      ],
    ));
  }

  Widget _getPage(int index) {
    

    switch (index) {
      case 4:
        return const AcountPage();
      case 3:
        return const MessagePage();
      case 2:
        return const SearchPage();
      case 1:
        return const CoursePage();
      case 0:
      default:
        return const HomePage();
    }
  }
}
