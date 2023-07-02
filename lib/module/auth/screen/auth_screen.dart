
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:standard_project/module/auth/controller/auth_controller.dart';
  
  class AuthScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (AuthController controller) {
          return Scaffold();
        },
      );
    }
  }