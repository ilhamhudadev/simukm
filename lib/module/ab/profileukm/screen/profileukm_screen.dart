import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/module/ab/profileukm/controller/profileukm_controller.dart';

class ProfileukmScreen extends StatelessWidget {
  QuillController _controller = QuillController.basic();
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetBuilder<ProfileukmController>(
        init: ProfileukmController(),
        builder: (ProfileukmController controller) {
          return Scaffold(
            backgroundColor: Color(0x6BDEDDDD),
            body: SingleChildScrollView(
              child: Center(
                  child: Column(
                children: [
                  Container(
                    height: 150,
                    width: AppSize.screenWidth * 3,
                    decoration: BoxDecoration(color: Color(0xFFDADADA)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       text()
                      ],
                    ),
                  ),
                  QuillToolbar.basic(
                      controller: _controller,
                    ),
                  
               
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: QuillEditor.basic(
                            controller: _controller, readOnly: false),
                ),
        ]
              )),
            ),
          );
        });
  }

  Widget text () {
    return Container(
     child: Icon(Icons.flutter_dash,size: 50,)
    );
  }
}


  
  

