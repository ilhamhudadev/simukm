import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/module/ab/profileukm/controller/managementDecree_controller.dart';

class MenegementDecreeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetBuilder<ManegementDecreeController>(
        init: ManegementDecreeController(),
        builder: (ManegementDecreeController controller) {
          return Scaffold(
            body: Container(
                decoration: BoxDecoration(color: Colors.grey),
                width: AppSize.screenWidth * 2,
                height: AppSize.screenHeight,
                child: GridView.builder(
                  itemCount: 100,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Center(child: item());
                  },
                )),
          );
        });
  }

  Widget item() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
