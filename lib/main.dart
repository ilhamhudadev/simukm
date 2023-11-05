import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/localization/app_language.dart';
import 'package:standard_project/core/network/status_network_binding.dart';
import 'package:standard_project/core/style/app_color.dart';

import 'core/route/app_route.dart';
import 'core/route/route_constant.dart';

void main() {
  // getLocale().
  //then((locale) {
  runApp(const MainScreen(
    appLocale: Locale('en'),
  ));
  // });
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
    required this.appLocale,
  });
  final Locale? appLocale;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: AppColors.placeholdertextfield,
      initialBinding: StatusNetworkBinding(),
      translations: AppLanguage(),
      locale: appLocale,
      getPages: AppRoute.all,
      initialRoute: RouteConstant.sidebar,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
    );
  }
}
