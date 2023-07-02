
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:standard_project/module/study/controller/study_controller.dart';
  
  class StudyScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return GetBuilder<StudyController>(
        init: StudyController(),
        builder: (StudyController controller) {
          return Scaffold();
        },
      );
    }
  }