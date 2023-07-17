
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:standard_project/module/me/usermanagement/controller/usermanagement_controller.dart';
  
  class UsermanagementScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return GetBuilder<UsermanagementController>(
        init: UsermanagementController(),
        builder: (UsermanagementController controller) {
          return Scaffold();
        },
      );
    }
  }