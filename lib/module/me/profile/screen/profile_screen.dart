
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:standard_project/module/me/profile/controller/profile_controller.dart';
  
  class ProfileScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (ProfileController controller) {
          return Scaffold();
        },
      );
    }
  }