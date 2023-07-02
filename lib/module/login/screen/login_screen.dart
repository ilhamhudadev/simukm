
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:standard_project/module/login/controller/login_controller.dart';
  
  class LoginScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (LoginController controller) {
          return Scaffold();
        },
      );
    }
  }