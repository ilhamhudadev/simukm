
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:standard_project/module/me/forgotpassword/controller/forgotpassword_controller.dart';
  
  class ForgotpasswordScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return GetBuilder<ForgotpasswordController>(
        init: ForgotpasswordController(),
        builder: (ForgotpasswordController controller) {
          return Scaffold();
        },
      );
    }
  }