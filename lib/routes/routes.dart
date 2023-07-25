
import 'package:onlinecourse/screens/course_detail_page.dart';

import '../screens/main/mainpage.dart';
import 'name.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(
    name: Screens.root, page: ()=>const Mainpage()
  ),
  GetPage(
    name: Screens.courseDetailPage, page: ()=>const CourseDetailPage()
  )
];
