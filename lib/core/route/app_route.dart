import 'package:get/get.dart';
import 'package:standard_project/core/route/route_constant.dart';
import 'package:standard_project/module/me/profile/screen/profile_screen.dart';
import 'package:standard_project/module/me/signin/screen/signin_screen.dart';

class AppRoute {
  static final all = [
    //Module Preview
    GetPage(name: RouteConstant.signIn, page: () => SigninScreen()),
    GetPage(name: RouteConstant.profile, page: () => ProfileScreen()),
  ];
}
