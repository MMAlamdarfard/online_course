import 'package:flutter/material.dart';
import 'package:onlinecourse/model/course.dart';
import 'package:digit_to_persian_word/digit_to_persian_word.dart';
import 'package:onlinecourse/model/pageview_model.dart';
import 'package:onlinecourse/constant/colors.dart';
import 'package:get/get.dart';
import 'package:onlinecourse/routes/name.dart';

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
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 12,
          ),
          pageView(),git 
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
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: listcourses.length,
                          itemBuilder: (context, index) {
                            return Material(
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(Screens.courseDetailPage,
                                      parameters: {
                                        "model":
                                            listcourses[index].price.toString()
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
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColors.greyColor
                                                    .withOpacity(0.4),
                                                blurRadius: 8.0,
                                                spreadRadius: 2.0,
                                              ),
                                            ],
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    listcourses[index].path))),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            listcourses[index].description,
                                          ),
                                          Row(
                                            children: [
                                              const Text("تومان"),
                                              Text(
                                                  " ${DigitFormat.convert(listcourses[index].price.toString(), separator: ",")} "),
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
                  color: index ==
                          (pageViewModel.length - 1) -
                              controller.getviewPageIndex()
                      ? AppColors.blueColor
                      : AppColors.greyColor,
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
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyColor.withOpacity(0.4),
                      blurRadius: 8.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(pageViewModel[index].path))),
            );
          })),
    );
  }
}
