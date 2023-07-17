
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:standard_project/module/mr/listukm/controller/listukm_controller.dart';
  
  class ListukmScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return GetBuilder<ListukmController>(
        init: ListukmController(),
        builder: (ListukmController controller) {
          return Scaffold();
        },
      );
    }
  }