import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_color.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/module/me/profile/controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext contextProfile) {
    AppSize().init(contextProfile);
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (ProfileController controller) {
        return Scaffold(
          backgroundColor: Color(0xFFEBEAEA),
          body: Center(
            child: Container(
              width: AppSize.screenWidth * 2.3,
              height: AppSize.screenWidth * 2,
              decoration:
                  BoxDecoration(color: Color.fromARGB(59, 199, 199, 199)),
              child: Container(
                margin: EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    profile(contextProfile),
                    Column(
                      children: [
                        sosialMedia(contextProfile),
                        Accounts(contextProfile),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget gradiancolors() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xff027dfd),
        Color(0xff4100e0),
        AppColors.softYellow,
      ], end: Alignment.topRight)),
    );
  }

  Widget buttonEditPassword(context) {
    return InkWell(onTap: () {
      showDialog<void>(
          context: context,
          barrierDismissible: true, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                height: 300,
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(children: [
                    Text(
                      'Reset your password',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'New Password',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'New Password',
                            fillColor: Colors.grey[200],
                            filled: true),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Confirm New Password',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'Confirm New Password',
                            fillColor: Colors.grey[200],
                            filled: true),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              ),
            );
          });
    });
  }

  Container Accounts(context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      width: 550,
      height: 250,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 5.0, offset: Offset(0, 1))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Accounts",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                resetPassword(context),
              ],
            ),
          ),
          Divider(
            endIndent: 0,
            color: Colors.grey,
            indent: 0,
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(),
            margin: EdgeInsets.only(left: 30, right: 20, top: 10),
            padding: EdgeInsets.all(5),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person_2,
                        color: AppColors.bluese,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        width: 200,
                        child: Text(
                          'Username',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Text(
                        'Hamisi345',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.lock_outline,
                        color: AppColors.bluese,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        width: 200,
                        child: Text(
                          'password',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Text(
                        '***********',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget resetPassword(context) {
    return InkWell(
      onTap: () {
        showDialog<void>(
            context: context,
            barrierDismissible: true, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                content: Container(
                  height: 350,
                  width: 500,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            child: Icon(Icons.close),
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Reset your password',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'New Password',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'New Password',
                            fillColor: Colors.grey[200],
                            filled: true),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Confirm New Password',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'Confirm New Password',
                            fillColor: Colors.grey[200],
                            filled: true),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(
                            right: 20, left: 20, bottom: 10, top: 10),
                        decoration: BoxDecoration(
                          color: AppColors.bilu,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child:
                            Text('Save', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ]),
                ),
              );
            });
      },
      child: Container(
        padding: EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 10),
        decoration: BoxDecoration(
          color: AppColors.bilu,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text('Change Password', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget sosialMedia(context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      width: 550,
      height: 270,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 5.0, offset: Offset(0, 1))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sosial media",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                buttonedit(context),
              ],
            ),
          ),
          Divider(
            endIndent: 0,
            color: Colors.grey,
            indent: 0,
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(),
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: EdgeInsets.all(5),
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/instagram.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        width: 150,
                        child: Row(
                          children: [
                            Text(
                              'Instagram',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Hmisi',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/youtube.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        width: 150,
                        child: Text(
                          'Youtube',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Text(
                        'Himpunan mahasiswa it',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/twitter.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        width: 150,
                        child: Text(
                          'Twitter',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Text(
                        'Hamisi',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  InkWell buttonedit(context) {
    return InkWell(
      onTap: () {
        showDialog<void>(
            context: context,
            barrierDismissible: true, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                content: Container(
                  height: 500,
                  width: 500,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            child: Icon(Icons.close),
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Sosial Media',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'instagram',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'instagram',
                            fillColor: Colors.grey[200],
                            filled: true),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Youtube',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'your youtube',
                            fillColor: Colors.grey[200],
                            filled: true),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Twitter',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'Twitter',
                            fillColor: Colors.grey[200],
                            filled: true),
                      ),
                    ),
                  ]),
                ),
              );
            });
      },
      child: Container(
        padding: EdgeInsets.only(right: 20, left: 20, bottom: 10, top: 10),
        decoration: BoxDecoration(
          color: AppColors.bilu,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text('Edit', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget profile(context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
          width: 450,
          height: AppSize.screenHeight,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 5.0, offset: Offset(0, 1))
              ]),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 450,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/bgr.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                  ),
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(150),
                            image: DecorationImage(
                                image: AssetImage('assets/profile.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: 450,
                padding: EdgeInsets.only(left: 50, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "HAMISI",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Himpunan Mahasiswa Piksi sistem Informasi',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(shape: BoxShape.rectangle),
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 150,
                              child: Text(
                                'Phone',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Text(
                              '+62-851-3902-627',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Divider(
                          endIndent: 30,
                          color: Colors.grey,
                          indent: 0,
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 150,
                              child: Text(
                                'Email',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Text(
                              'hamisi@gmail.com',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Divider(
                          endIndent: 30,
                          color: Colors.grey,
                          indent: 0,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              buttoneditProfile(context)
            ],
          ),
        ),
      ],
    );
  }

  InkWell buttoneditProfile(context) {
    return InkWell(
      onTap: () {
        showDialog<void>(
            context: context,
            barrierDismissible: true, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                content: Container(
                  height: 300,
                  width: 500,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            child: Icon(Icons.close),
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Edit Profile ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Phone',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'phone',
                            fillColor: Colors.grey[200],
                            filled: true),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'Email',
                            fillColor: Colors.grey[200],
                            filled: true),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(
                            right: 20, left: 20, bottom: 10, top: 10),
                        decoration: BoxDecoration(
                          color: AppColors.bilu,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child:
                            Text('Save', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ]),
                ),
              );
            });
      },
      child: Container(
        padding: EdgeInsets.only(right: 30, left: 30, bottom: 10, top: 10),
        decoration: BoxDecoration(
          color: AppColors.bilu,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text('Edit', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
