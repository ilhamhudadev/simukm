
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:standard_project/module/ac/achievement/controller/achievement_controller.dart';
  
  class AchievementScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return GetBuilder<AchievementController>(
        init: AchievementController(),
        builder: (AchievementController controller) {
          return Scaffold();
        },
      );
    }
  }