
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:standard_project/module/main/sidebar/controller/sidebar_controller.dart';
  
  class SidebarScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return GetBuilder<SidebarController>(
        init: SidebarController(),
        builder: (SidebarController controller) {
          return Scaffold();
        },
      );
    }
  }