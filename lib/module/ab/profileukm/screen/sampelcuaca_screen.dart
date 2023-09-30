import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_color.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/module/ab/profileukm/controller/sampelcuaca_controller.dart';

class SampelCuacaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetBuilder<SampelCuacaController>(
        init: SampelCuacaController(),
        builder: (SampelCuacaController controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: AppSize.screenHeight,
                    width: AppSize.screenWidth,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                        controller: controller.scrolController,
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: ((context, index) {
                          return Container(
                            margin: EdgeInsets.only(top: 10,left: 5),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: AppColors.bilu,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: AppColors.crimson)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Kecamatan :',style: TextStyle(color: Colors.white),),
                                Text('Kota :',style: TextStyle(color: Colors.white),),
                                Text('Lotitude :',style: TextStyle(color: Colors.white),),
                                Text('Longtitude :',style: TextStyle(color: Colors.white),)
                              ],
                            ),
                          );
                        })),
                  )
                ],
              ),
            ),
          );
        });
  }
}
