import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/module/me/signin/controller/signin_controller.dart';

class SigninScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SigninController>(
      init: SigninController(),
      builder: (SigninController controller) {
        return Scaffold(
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [blok(), blok(), blok(), blok()],
              )
            ]));
      },
    );
  }

  Widget blok() {
    return Container(
      height: 100,
      width: 100,
      color: Colors.purple,
      child: Center(
          child: Text(
        "Sample",
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
