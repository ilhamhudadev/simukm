import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_color.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/module/me/signin/controller/signin_controller.dart';

class SigninScreen extends StatelessWidget {
  @override
  Widget build(BuildContext contextsignin) {
    AppSize().init(contextsignin);
    return GetBuilder<SigninController>(
        init: SigninController(),
        builder: (SigninController controller) {
          return Scaffold(
              body: Container(
            width: AppSize.screenWidth * 3,
            height: AppSize.screenWidth * 2,
            color: Colors.grey,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: AppSize.screenHeight,
                    color: AppColors.bilu,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'data:image/png;base64,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',
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: VerticalDivider(
                              endIndent: 250,
                              color: Colors.white,
                              indent: 250,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'UKM MAHASISWA',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      BoxShadow(
                                        color: Colors.black,
                                      )
                                    ]),
                              ),
                              Text(
                                'POLITEKNIK PIKSI GANESHA',
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      BoxShadow(
                                        color: Colors.black,
                                      )
                                    ]),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: AppSize.screenHeight,
                    color: Colors.white,
                    child: Center(
                        child: Container(
                      width: AppSize.screenWidth * 1,
                      height: AppSize.screenHeight * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sign in UKM Mahasiswa',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    decoration:
                                        InputDecoration(labelText: 'Email*'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    scribbleEnabled: true,
                                    decoration: InputDecoration(
                                      labelText: 'Password*',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: 10, bottom: 10, right: 231, left: 231),
                            decoration: BoxDecoration(
                              color: AppColors.bilu,
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ));
        });
  }

  Widget button(context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(right: 30, left: 30, bottom: 7, top: 7),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(20)),
        child: Text('Login',
            style: TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }

  Widget button2(title) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(20),
      child: Container(
          width: 150,
          height: 35,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
