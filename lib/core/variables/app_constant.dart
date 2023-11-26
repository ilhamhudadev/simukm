import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_color.dart';

class AppConstant {
  static const String sessionUserData = "sessionUserData";
  static const String languageCode = "languageCode";

  // Start Snackbar --------------------------------------------
  setSnackbar(String msg) {
    return ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(
          msg,
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        elevation: 6.0,
        margin: const EdgeInsets.all(30.0),
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(20),
        )),
        duration: const Duration(seconds: 2),
      ),
    );
  }
// End Snackbar ---------------------------------------------
}
