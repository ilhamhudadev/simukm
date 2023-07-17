
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:standard_project/module/main/dashboard/controller/dashboard_controller.dart';
  
  class DashboardScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (DashboardController controller) {
          return Scaffold();
        },
      );
    }
  }