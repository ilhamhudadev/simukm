import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/module/ab/profileukm/controller/VisiMisi_controller.dart';

class VisiMisiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetBuilder<VisiMisiController>(
        init: VisiMisiController(),
        builder: (VisiMisiController controller) {
          return Scaffold(
            backgroundColor: Color(0xDDEAEAEA),
            body: SingleChildScrollView(
                child: Center(
            
            )),
          );
        });
  }

}
