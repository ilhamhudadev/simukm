import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/module/pr/proposal/controller/proposal_controller.dart';

class ProposalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetBuilder<ProposalController>(
      init: ProposalController(),
      builder: (ProposalController controller) {
        return Scaffold(
            backgroundColor: Color(0xFF678DD8),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    height: AppSize.screenHeight,
                    width: AppSize.screenWidth * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return item();
                        }),
                  )
                ],
              ),
            ));
      },
    );
  }

  Widget item() {
    return Container(
      padding: EdgeInsets.only(left: 30, top: 10),
      margin: EdgeInsets.all(10),
      height: AppSize.screenHeight * 0.2,
      width: AppSize.screenWidth * 0.7,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('nama'),
          Text('kelas'),
          Text('jurusan'),
        ],
      ),
    );
  }
}
