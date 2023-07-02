import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/module/grade/gradeacademic/controller/gradeacademic_controller.dart';

class GradeacademicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GradeacademicController>(
      init: GradeacademicController(),
      builder: (GradeacademicController controller) {
        return Scaffold(
          body: Container(
            child: Column(),
          ),
        );
      },
    );
  }
}
