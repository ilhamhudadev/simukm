
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:standard_project/module/ab/profileukm/controller/profileukm_controller.dart';
  
  class ProfileukmScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return GetBuilder<ProfileukmController>(
        init: ProfileukmController(),
        builder: (ProfileukmController controller) {
          return Scaffold();
        },
      );
    }
  }