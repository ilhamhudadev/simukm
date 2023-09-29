import 'package:get/get.dart';
import 'package:standard_project/core/route/route_constant.dart';
import 'package:standard_project/module/ab/profileukm/screen/Decree_screen.dart';
import 'package:standard_project/module/ab/profileukm/screen/organizationalStructure_screen.dart';
import 'package:standard_project/module/ab/profileukm/screen/profileukm_screen.dart';
import 'package:standard_project/module/ab/profileukm/screen/report_screen.dart';
import 'package:standard_project/module/ab/profileukm/screen/sampelcuaca_screen.dart';
import 'package:standard_project/module/ab/profileukm/screen/visimisi_screen.dart';
import 'package:standard_project/module/ev/event/screen/event_screen.dart';
import 'package:standard_project/module/me/profile/screen/profile_screen.dart';
import 'package:standard_project/module/me/signin/screen/signin_screen.dart';
import 'package:standard_project/module/me/usermanagement/screen/usermanagement_screen.dart';

class AppRoute {
  static final all = [
    //Module Preview
    GetPage(name: RouteConstant.signIn, page: () => SigninScreen()),
    GetPage(name: RouteConstant.profile, page: () => ProfileScreen()),
    GetPage(
        name: RouteConstant.usermenegement, page: () => UsermanagementScreen()),
    GetPage(name: RouteConstant.visimisi, page: () => VisiMisiScreen()),
    GetPage(name: RouteConstant.decree, page: () => DecreeScreen()),
    GetPage(
        name: RouteConstant.organizationalstruktur,
        page: () => OrganizationalStruktureScreen()),
    GetPage(name: RouteConstant.report, page: () => ReportScreen()),
    GetPage(name: RouteConstant.profileukm, page: () => ProfileukmScreen()),
    GetPage(name: RouteConstant.event, page: () => EventScreen()),
    GetPage(name: RouteConstant.sampelcuaca, page: () => SampelCuacaScreen()),
  ];
}
