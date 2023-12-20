import 'package:get/get.dart';
import 'package:standard_project/core/route/route_constant.dart';
import 'package:standard_project/module/ab/profileukm/screen/report_screen.dart';
import 'package:standard_project/module/ab/profileukm/screen/visimisi_screen.dart';
import 'package:standard_project/module/ac/achievement/screen/achievement_screen.dart';
import 'package:standard_project/module/ab/profileukm/screen/Decree_screen.dart';
import 'package:standard_project/module/ab/profileukm/screen/organizationalStructure_screen.dart';
import 'package:standard_project/module/ev/event/screen/event_screen.dart';
import 'package:standard_project/module/main/sidebar/screen/sidebar_screen.dart';
import 'package:standard_project/module/me/profile/screen/profile_screen.dart';
import 'package:standard_project/module/me/signin/screen/signin_screen.dart';
import 'package:standard_project/module/me/usermanagement/screen/usermanagement_screen.dart';

import 'package:standard_project/module/mr/listukm/screen/listukm_screen.dart';
import 'package:standard_project/module/pr/proposal/screen/proposal_screen.dart';

class AppRoute {
  static final all = [
    //Module Preview

    GetPage(name: RouteConstant.profile, page: () => ProfileScreen()),

    GetPage(name: RouteConstant.signIn, page: () => SigninScreen()),
    GetPage(
        name: RouteConstant.usermanagement, page: () => UsermanagementScreen()),
    GetPage(name: RouteConstant.proposal, page: () => ProposalScreen()),

    GetPage(name: RouteConstant.VisiMisi, page: () => VisiMisiScreen()),
    GetPage(name: RouteConstant.Achievement, page: () => AchievementScreen()),
    GetPage(name: RouteConstant.event, page: () => EventScreen()),
    GetPage(name: RouteConstant.listukm, page: () => ListukmScreen()),
    GetPage(name: RouteConstant.report, page: () => ReportScreen()),
    GetPage(
        name: RouteConstant.organizationStruktur,
        page: () => OrganizationalStruktureScreen()),
    GetPage(name: RouteConstant.decree, page: () => DecreeScreen()),

    GetPage(name: RouteConstant.sidebar, page: () => SideBarScreen()),
  ];
}
