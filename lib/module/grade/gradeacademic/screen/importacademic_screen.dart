import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/module/grade/gradeacademic/controller/gradeacademic_controller.dart';
import 'package:standard_project/module/grade/gradeacademic/controller/importacademic_controller.dart';

class ImportAcademicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImportAcademicController>(
      init: ImportAcademicController(),
      builder: (ImportAcademicController controller) {
        return Scaffold(
          body: Container(
            child: Column(
              children: [Text("${controller.lectureName}")],
            ),
          ),
        );
      },
    );
  }
}
