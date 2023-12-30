import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:standard_project/core/globalcontroller/app_function.dart';
import 'package:standard_project/core/localization/app_language.dart';
import 'package:standard_project/core/network/status_network_binding.dart';
import 'package:standard_project/core/style/app_color.dart';

import 'core/route/app_route.dart';
import 'core/route/route_constant.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            color: AppColors.placeholdertextfield,
            initialBinding: StatusNetworkBinding(),
            translations: AppLanguage(),
            locale: Locale('en'), // You can set the default locale here
            getPages: AppRoute.all,
            initialRoute: snapshot.data ?? false
                ? RouteConstant.sidebar
                : RouteConstant.signIn,
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.rightToLeft,
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Future<bool> _isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_logged_in') ?? false;
  }
}
