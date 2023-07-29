import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlinecourse/constant/colors.dart';
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
    
    

    final Controller controller = Get.put(Controller());
  
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
        body: Stack(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 90, bottom: 80),
            child: Obx(() => _getPage(controller.getIndex()))),
         Positioned(
          top: 0,
          left: 0,
          child: MyAppBar(
           backgroundColor: AppColors.appBarColor,
           iconsColor: AppColors.statusBarIconColor,
           statusBarColor: AppColors.statusBarBrightness,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: SizedBox(
            height: 80,
            child: MyBottomNavigationBar(
              backGroundColor: AppColors.appBarColor,
              selectedIconColor: AppColors.bottomNavigaitonBarSelectedColor,
              unselectedIconColor: AppColors.bottomNavigaitonBarUnselectedColor,
            ),
          ),
        ),
      ],
    ));
  }

  Widget _getPage(int index) {
    

    switch (index) {
      case 4:
        return AcountPage();
      case 3:
        return  MessagePage();
      case 2:
        return  SearchPage();
      case 1:
        return  CoursePage();
      case 0:
      default:
        return  HomePage();
    }
  }
}
