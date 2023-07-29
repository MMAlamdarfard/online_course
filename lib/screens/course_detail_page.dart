import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:digit_to_persian_word/digit_to_persian_word.dart';
import 'package:onlinecourse/constant/string.dart';
import 'package:onlinecourse/controller/controller.dart';
import 'package:onlinecourse/model/lesson.dart';

import 'package:better_player/better_player.dart';
import '../constant/colors.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({super.key});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  late BetterPlayerController betterPlayerController;
  @override
  void dispose() {
    betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    Controller controller = Get.find();
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      "http://192.168.157.248:3000/flutter1.mp4",
    );
    betterPlayerController = BetterPlayerController(
        const BetterPlayerConfiguration(),
        betterPlayerDataSource: betterPlayerDataSource);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: AppColors.statusBarBrightness,
        statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SizedBox(
        child: Stack(children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(bottom: 0.09 * Get.height),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              border: Border.all(
                                width: 0.5,
                                color: AppColors.mainTextColor,
                              )),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(CupertinoIcons.back),
                            ),
                          ),
                        ),
                        Text(
                          "جزئیات درس",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.mainTextColor),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              border: Border.all(
                                width: 0.5,
                                color: AppColors.mainTextColor,
                              )),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.bookmark_border),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  (controller.getIsPlayingVideoFromDetailPage())
                      ? Container(
                          width: Get.width * 0.9,
                          height: Get.height * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue,
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/images/flutter_tutorial.jpg")),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.greyColor.withOpacity(0.4),
                                blurRadius: 12.0,
                                spreadRadius: 5.0,
                              ),
                            ],
                          ))
                      : AspectRatio(
                          aspectRatio: 16 / 9,
                          child:
                              BetterPlayer(controller: betterPlayerController)),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                 Text("تومان",
                                style: TextStyle(color: AppColors.mainTextColor),
                                ),
                                Text(
                                    " ${DigitFormat.convert("4000000", separator: ",")} ",
                                    style: TextStyle(color:AppColors.mainTextColor),),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/profile.png",
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  "MohammadMahdi",
                                  style: TextStyle(color: AppColors.mainTextColor.withOpacity(0.7)),
                                )
                              ],
                            ),
                          ],
                        ),
                        Text(
                          "آموزش فلاتر",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: AppColors.mainTextColor),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "توضیحات",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColors.mainTextColor,
                              fontSize: 20),
                        ),
                        AnimatedSize(
                            curve: Curves.easeInToLinear,
                            duration: const Duration(milliseconds: 300),
                            //margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Obx(
                              () => Text.rich(
                                textDirection: TextDirection.rtl,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: (controller.getshowMoreText() &&
                                                AppString.bigText.length > 200)
                                            ? AppString.bigText
                                            : AppString.bigText
                                                .substring(0, 200),
                                        style: TextStyle(
                                            color: AppColors.mainTextColor.withOpacity(0.8),
                                            fontSize: 16)),
                                    (AppString.bigText.length > 200)
                                        ? TextSpan(
                                            text: controller.getshowMoreText()
                                                ? "  ...کمتر"
                                                : "  ...بیشتر",
                                            style: const TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () => controller
                                                  .reverseShowMoreText(),
                                          )
                                        : const TextSpan(),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    child: Divider(
                      thickness: 0.5,
                      color: AppColors.mainTextColor,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "درس ها",
                          style: TextStyle(
                              color: AppColors.mainTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ...List.generate(lessonsModel.length, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.transparent,
                                border:
                                    Border.all(color: AppColors.mainTextColor, width: 0.5)),
                            height: 75,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  color: AppColors.blueColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              child: const Icon(
                                                Icons.play_arrow_rounded,
                                                color: Colors.white,
                                              )),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            lessonsModel[index].title,
                                            style: TextStyle(color: AppColors.mainTextColor),
                                            
                                            )
                                        ],
                                      ),
                                      Text(lessonsModel[index].duration,
                                      style: TextStyle(
                                            color: AppColors.mainTextColor),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 10,
              right: 10,
              child: Container(
                  width: Get.width,
                  height: Get.height * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Get.height * 0.08),
                    color: AppColors.backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.greyColor.withOpacity(0.4),
                        blurRadius: 4.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: AppColors.blueColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(Get.height * 0.04))),
                      child: const Text(
                        "خرید اشتراک",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ))),
        ]),
      ),
    );
  }
}
