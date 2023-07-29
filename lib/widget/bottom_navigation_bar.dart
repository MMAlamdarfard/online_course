import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:onlinecourse/constant/string.dart';
import 'package:onlinecourse/constant/colors.dart';
import '../controller/controller.dart';

// ignore: must_be_immutable
class MyBottomNavigationBar extends StatelessWidget {
  Color? unselectedIconColor;
  Color? selectedIconColor;
  Color? backGroundColor;
  late Controller controller;
  MyBottomNavigationBar({super.key,this.backGroundColor,this.selectedIconColor,this.unselectedIconColor});

  @override
  Widget build(BuildContext context) {
    controller = Get.find();
    return Container(
      
      height: Get.height,
      width: Get.width,
      decoration: ShapeDecoration(
        color: backGroundColor,
        shape: CustomShapeBorder(MediaQuery.of(context).size),
        shadows: [
          BoxShadow(
            color: AppColors.blueColor.withOpacity(0.2),
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: Material(
              color: Colors.transparent,
              child: Obx(
                () => InkWell(
                  onTap: () {
                    controller.setIndex(0);
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 5,
                        decoration: BoxDecoration(
                            color: setColor(0, true),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.home,
                        color: setColor(0, false),
                        size: 30,
                      ),
                      Text(
                        AppString.home,
                        style:
                            TextStyle(color: setColor(0, false), fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Material(
              color: Colors.transparent,
              child: Obx(
                () => InkWell(
                  onTap: () {
                    controller.setIndex(1);
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 5,
                        decoration: BoxDecoration(
                            color: setColor(1, true),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.play_lesson,
                        color: setColor(1, false),
                        size: 30,
                      ),
                      Text(
                        AppString.courses,
                        style:
                            TextStyle(color: setColor(1, false), fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Transform.translate(
              offset: const Offset(0, -22),
              child: GestureDetector(
                onTap: () {
                  controller.setIndex(2);
                },
                child: Obx(
                  () => Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.blueColor.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.blueColor.withOpacity(0.6),
                                blurRadius: controller.getIndex() == 2 ? 12 : 4,
                                spreadRadius: 1,
                              )
                            ]),
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                      Text(
                        AppString.search,
                        style:
                            TextStyle(color: setColor(2, false), fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  controller.setIndex(3);
                },
                child: Obx(
                  () => Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 5,
                        decoration: BoxDecoration(
                            color: setColor(3, true),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.message,
                        color: setColor(3, false),
                        size: 30,
                      ),
                      Text(
                        AppString.messages,
                        style:
                            TextStyle(color: setColor(3, false), fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  controller.setIndex(4);
                },
                child: Obx(
                  () => Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 5,
                        decoration: BoxDecoration(
                            color: setColor(4, true),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Icon(
                        CupertinoIcons.person,
                        color: setColor(4, false),
                        size: 30,
                      ),
                      Text(
                        AppString.myAcount,
                        style:
                            TextStyle(color: setColor(4, false), fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  setColor(int index, bool isOpacity) => controller.getIndex() == index
      ? selectedIconColor
      : isOpacity?unselectedIconColor!.withOpacity(0):unselectedIconColor;
}

class CustomShapeBorder extends ShapeBorder {
  final Size size;
  const CustomShapeBorder(this.size);
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path path = Path()..moveTo(0, size.height - rect.height);
    path.lineTo(size.width * 0.4, size.height - rect.height);
    path.quadraticBezierTo(size.width * 0.5, size.height - 1.7 * rect.height,
        size.width * 0.6, size.height - rect.height);
    path.lineTo(size.width, size.height - rect.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.only(bottom: 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();
}
