import 'package:get/get.dart';
import 'package:standard_project/core/route/route_constant.dart';
import 'package:standard_project/module/grade/gradeacademic/screen/gradeacademic_screen.dart';
import 'package:standard_project/module/grade/gradeacademic/screen/importacademic_screen.dart';
import 'package:standard_project/module/home/screen/home_screen.dart';
import 'package:standard_project/module/preview/screen/preview_screen.dart';

class AppRoute {
  static final all = [
    //Module Preview
    GetPage(name: RouteConstant.preview, page: () => PreviewScreen()),
    GetPage(name: RouteConstant.homeScreen, page: () => HomeScreen()),
    GetPage(
        name: RouteConstant.gradeAcademicScreen,
        page: () => GradeacademicScreen()),
    GetPage(
        name: RouteConstant.importAcademiScreen,
        page: () => ImportAcademicScreen())
  ];
}
