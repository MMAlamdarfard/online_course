import 'package:flutter/material.dart';
import 'package:onlinecourse/model/course.dart';
import 'package:digit_to_persian_word/digit_to_persian_word.dart';
import 'package:onlinecourse/model/pageview_model.dart';
import 'package:onlinecourse/constant/colors.dart';
import 'package:get/get.dart';
import 'package:onlinecourse/routes/name.dart';
import 'package:onlinecourse/widget/scroll_behavior.dart';

import '../../controller/controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;
  late Controller controller;
  @override
  void initState() {
    super.initState();
    controller = Get.find();

    pageController = PageController(
        viewportFraction: 0.95, initialPage: controller.getviewPageIndex());
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
        body: ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 12,
            ),
            pageView(),
            indicator(),
            const SizedBox(
              height: 5,
            ),
            ...courseModel.keys.map((course) {
              List<Course> listcourses = courseModel[course] ?? [];
              if (listcourses.isNotEmpty) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          course,
                          style: TextStyle(
                              color: AppColors.mainTextColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(
                                decelerationRate: ScrollDecelerationRate.fast),
                            reverse: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: listcourses.length,
                            itemBuilder: (context, index) {
                              return Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed(Screens.courseDetailPage,
                                        parameters: {
                                          "model": listcourses[index]
                                              .price
                                              .toString()
                                        });
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 10),
                                          width: 150,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              // boxShadow: [
                                              //   BoxShadow(
                                              //     color: AppColors.greyColor
                                              //         .withOpacity(0.4),
                                              //     blurRadius: 8.0,
                                              //     spreadRadius: 2.0,
                                              //   ),
                                              // ],
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      listcourses[index]
                                                          .path))),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              listcourses[index].description,
                                              style: TextStyle(
                                                color: AppColors.mainTextColor
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "تومان",
                                                  style:TextStyle(
                                                    color: AppColors.mainTextColor.withOpacity(0.6)
                                                  ),
                                                ),
                                                Text(
                                                    " ${DigitFormat.convert(listcourses[index].price.toString(), separator: ",")} ",
                                                    style:TextStyle(
                                                      color:  AppColors
                                                              .mainTextColor
                                                              .withOpacity(
                                                                  0.6)
                                                    ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                );
              } else {
                return Container();
              }
            }),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    ));
  }

  indicator() {
    return Obx(
      () => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(pageViewModel.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceInOut,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: index ==
                      (pageViewModel.length - 1) - controller.getviewPageIndex()
                  ? 22
                  : 8,
              height: 8,
              decoration: BoxDecoration(
                 
                 boxShadow:
                  (index ==(pageViewModel.length - 1) -controller.getviewPageIndex())?
                  [
                    BoxShadow(
                      color: AppColors.bottomNavigaitonBarSelectedColor
                          .withOpacity(0.4),
                      blurRadius: 4.0,
                      spreadRadius: 1.0,
                    ),
                  ]:[]
                  ,
                  color: index ==
                          (pageViewModel.length - 1) -
                              controller.getviewPageIndex()
                      ? AppColors.bottomNavigaitonBarSelectedColor
                      : AppColors.bottomNavigaitonBarUnselectedColor,
                  borderRadius: BorderRadius.circular(4)),
            );
          })),
    );
  }

  pageView() {
    return SizedBox(
      height: Get.height * 0.25,
      child: PageView.builder(
          reverse: true,
          onPageChanged: (index) {
            controller.setviewPageIndex(index);
          },
          itemCount: pageViewModel.length,
          physics: const ClampingScrollPhysics(),
          controller: pageController,
          itemBuilder: ((context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: AppColors.greyColor.withOpacity(0.4),
                  //     blurRadius: 8.0,
                  //     spreadRadius: 2.0,
                  //   ),
                  // ],
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(pageViewModel[index].path))),
            );
          })),
    );
  }
}
