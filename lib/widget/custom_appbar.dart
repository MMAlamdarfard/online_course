import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:onlinecourse/constant/colors.dart';
import 'package:onlinecourse/constant/string.dart';

import '../services/theme_services.dart';

// ignore: must_be_immutable
class MyAppBar extends StatefulWidget {
  Color? backgroundColor;
  Color? iconsColor;
  Brightness? statusBarColor;
  MyAppBar({super.key, this.backgroundColor,this.iconsColor,this.statusBarColor});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: widget.statusBarColor,
        statusBarColor: Colors.transparent));
  
    return Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.bottomNavigaitonBarSelectedColor.withOpacity(0.2),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 5),
        width: context.isLandscape ? Get.height : Get.width,
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/profile.png",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(
                      CupertinoIcons.bell,
                      color: widget.iconsColor,
                      )
                      ),
                IconButton(
                  onPressed: (() {
                    ThemeService().switchTheme();
                  }),
                  icon: Icon(
                      Get.isDarkMode
                          ? Icons.nightlight_outlined
                          : Icons.wb_sunny_outlined,
                      size: 20,
                      color: widget.iconsColor),
                ),
              ],
            ),
            Text(
              AppString.appName,
              style: TextStyle(fontSize: 24, color: widget.iconsColor),
            )
          ],
        ));
    
  }
}
