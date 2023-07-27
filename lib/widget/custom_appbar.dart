import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:onlinecourse/constant/colors.dart';
import 'package:onlinecourse/constant/string.dart';


import '../services/theme_services.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
        decoration: BoxDecoration(
          color: context.theme.primaryColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.blueColor.withOpacity(0.2),
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
                  "assets/images/profile.jpg",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(CupertinoIcons.bell)),
                IconButton(
                    onPressed: (() {
                      ThemeService().switchTheme();
                    }),
                    icon: Icon(
                        Get.isDarkMode
                            ? Icons.wb_sunny_outlined
                            : Icons.nightlight_outlined,
                        size: 20,
                        color: (Get.isDarkMode) ? Colors.white : Colors.black),
                  ),
                
              ],
            ),
            const Text(
              AppString.appName,
              style: TextStyle(fontSize: 24, color: Colors.black),
            )
          ],
        ));
    // return Container(
    //   width: Get.width,
    //   margin:const EdgeInsets.symmetric(horizontal: 15),
    //   decoration: BoxDecoration(
    //     color: Colors.white,

    //     boxShadow: [
    //       BoxShadow(
    //         color: AppColors.blueColor.withOpacity(0.2),
    //         blurRadius: 5.0,
    //         spreadRadius: 1.0,
    //       ),
    //     ],
    //   ),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //
    //     ],
    //   ),
    // );
  }
}
