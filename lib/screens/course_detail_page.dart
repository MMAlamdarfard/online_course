import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:digit_to_persian_word/digit_to_persian_word.dart';
import 'package:onlinecourse/constant/string.dart';
import 'package:onlinecourse/controller/controller.dart';

import '../constant/colors.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(bottom: 0.08 * Get.height),
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
                                width: 1,
                                color: Colors.black.withOpacity(0.5),
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
                              color: Colors.grey.shade600),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              border: Border.all(
                                width: 1,
                                color: Colors.black.withOpacity(0.5),
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
                  Container(
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
                      )),
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
                                const Text("تومان"),
                                Text(
                                    " ${DigitFormat.convert("4000000", separator: ",")} "),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/profile.jpg",
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  "MohammadMahdi",
                                  style: TextStyle(color: Colors.grey.shade500),
                                )
                              ],
                            ),
                          ],
                        ),
                        const Text(
                          "آموزش فلاتر",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "توضیحات",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
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
                                            color: Colors.grey.shade600,
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
                      color: AppColors.greyColor,
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "درس ها",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                             
                          ),
                        ),
                       ...List.generate(6, (index) {
                        return Container(
                        color: Colors.amber,
                        margin:const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                        height: 80,
                  
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
                height: Get.height * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Get.height * 0.08),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyColor.withOpacity(0.4),
                      blurRadius: 7.0,
                      spreadRadius: 5.0,
                    ),
                  ],
                ),
                child: Container(
                  margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: AppColors.blueColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Get.height*0.04))),
                    child: const Text(
                      "خرید اشتراک",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),),
                )
                // child: Material(
                //   child: Container(
                //     margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                //     decoration: BoxDecoration(
                //       color: Colors.blue,
                //       borderRadius: BorderRadius.circular(Get.height * 0.08)
                //     ),
                //     child:InkWell(
                //       onTap: (){},
                //       child:const Center(
                //         child: Text("dddddd"),
                //       ),
                //     ) ,
                //   ),
                // ),
              )),
        ]),
      ),
    );
  }
}













































// import 'package:flutter/material.dart';
// // ignore: depend_on_referenced_packages
// import 'package:flutter_svg/flutter_svg.dart';

// import '../constant/constant.dart';

// class DetailsScreen extends StatelessWidget {
//   const DetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           color: Color(0xFFF5F4EF),
//           image: DecorationImage(
//             image: AssetImage("assets/images/ux_big.png"),
//             alignment: Alignment.topRight,
//           ),
//         ),
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       SvgPicture.asset("assets/icons/arrow-left.svg"),
//                       SvgPicture.asset("assets/icons/more-vertical.svg"),
//                     ],
//                   ),
//                   const SizedBox(height: 30),
//                   ClipPath(
//                     clipper: BestSellerClipper(),
//                     child: Container(
//                       color: kBestSellerColor,
//                       padding: const EdgeInsets.only(
//                           left: 10, top: 5, right: 20, bottom: 5),
//                       child: Text(
//                         "BestSeller".toUpperCase(),
//                         style: const TextStyle(
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   const Text("Design Thinking", style: kHeadingextStyle),
//                   const SizedBox(height: 16),
//                   Row(
//                     children: <Widget>[
//                       SvgPicture.asset("assets/icons/person.svg"),
//                       const SizedBox(width: 5),
//                       const Text("18K"),
//                       const SizedBox(width: 20),
//                       SvgPicture.asset("assets/icons/star.svg"),
//                       const SizedBox(width: 5),
//                       const Text("4.8")
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: "\$50 ",
//                           style: kHeadingextStyle.copyWith(fontSize: 32),
//                         ),
//                         TextSpan(
//                           text: "\$70",
//                           style: TextStyle(
//                             color: kTextColor.withOpacity(.5),
//                             decoration: TextDecoration.lineThrough,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 60),
//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                   color: Colors.white,
//                 ),
//                 child: Stack(
//                   children: <Widget>[
//                     const Padding(
//                       padding: EdgeInsets.all(30),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text("Course Content", style: kTitleTextStyle),
//                           SizedBox(height: 30),
//                           CourseContent(
//                             number: "01",
//                             duration: 5.35,
//                             title: "Welcome to the Course",
//                             isDone: true,
//                           ),
//                           CourseContent(
//                             number: '02',
//                             duration: 19.04,
//                             title: "Design Thinking - Intro",
//                             isDone: true,
//                           ),
//                           CourseContent(
//                             number: '03',
//                             duration: 15.35,
//                             title: "Design Thinking Process",
//                           ),
//                           CourseContent(
//                             number: '04',
//                             duration: 5.35,
//                             title: "Customer Perspective",
//                           ),
//                         ],
//                       ),
//                     ),
//                     Positioned(
//                       right: 0,
//                       left: 0,
//                       bottom: 0,
//                       child: Container(
//                         padding: const EdgeInsets.all(20),
//                         height: 100,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(40),
//                           boxShadow: [
//                             BoxShadow(
//                               offset: const Offset(0, 4),
//                               blurRadius: 50,
//                               color: kTextColor.withOpacity(.1),
//                             ),
//                           ],
//                         ),
//                         child: Row(
//                           children: <Widget>[
//                             Container(
//                               padding: const EdgeInsets.all(14),
//                               height: 56,
//                               width: 80,
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFFFFEDEE),
//                                 borderRadius: BorderRadius.circular(40),
//                               ),
//                               child: SvgPicture.asset(
//                                   "assets/icons/shopping-bag.svg"),
//                             ),
//                             const SizedBox(width: 20),
//                             Expanded(
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 height: 56,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(40),
//                                   color: kBlueColor,
//                                 ),
//                                 child: Text(
//                                   "Buy Now",
//                                   style: kSubtitleTextSyule.copyWith(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CourseContent extends StatelessWidget {
//   final String? number;
//   final double? duration;
//   final String? title;
//   final bool? isDone;
//   const CourseContent({
//     Key? key,
//     this.number,
//     this.duration,
//     this.title,
//     this.isDone = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 30),
//       child: Row(
//         children: <Widget>[
//           Text(
//             number!,
//             style: kHeadingextStyle.copyWith(
//               color: kTextColor.withOpacity(.15),
//               fontSize: 32,
//             ),
//           ),
//           const SizedBox(width: 8),
//           RichText(
//             text: TextSpan(
//               children: [
//                 TextSpan(
//                   text: "$duration mins\n",
//                   style: TextStyle(
//                     color: kTextColor.withOpacity(.5),
//                     fontSize: 18,
//                   ),
//                 ),
//                 TextSpan(
//                   text: title,
//                   style: kSubtitleTextSyule.copyWith(
//                     fontWeight: FontWeight.w600,
//                     height: 1.5,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const Spacer(),
//           Container(
//             margin: const EdgeInsets.only(left: 20),
//             height: 40,
//             width: 40,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: kGreenColor.withOpacity(isDone! ? 1 : .5),
//             ),
//             child: const Icon(Icons.play_arrow, color: Colors.white),
//           )
//         ],
//       ),
//     );
//   }
// }

// class BestSellerClipper extends CustomClipper<Path> {
//   @override
//   getClip(Size size) {
//     var path = Path();
//     path.lineTo(size.width - 20, 0);
//     path.lineTo(size.width, size.height / 2);
//     path.lineTo(size.width - 20, size.height);
//     path.lineTo(0, size.height);
//     path.lineTo(0, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper oldClipper) {
//     return false;
//   }
// }
