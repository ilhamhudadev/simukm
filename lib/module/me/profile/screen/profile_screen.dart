import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_color.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/module/me/profile/controller/profile_controller.dart';
import 'package:standard_project/module/me/profile/data/model/profile_model.dart';
import 'package:standard_project/module/me/usermanagement/data/model/users_model.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext contextProfile) {
    AppSize().init(contextProfile);
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (ProfileController controller) {
        controller.getUsersManagementData();
        return Scaffold(
            backgroundColor: AppColors.greybegroud,
            body: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Center(
                child: Container(
                  width: AppSize.screenWidth * 3,
                  height: AppSize.screenWidth * 3,
                  decoration: const BoxDecoration(color: Color(0xFFE9E8E8)),
                  child: Obx(() => controller.userListData.isNotEmpty
                      ? Container(
                          margin: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              profile(contextProfile,
                                  controller.userListData[0], controller),
                              Column(
                                children: [
                                  sosialMedia(contextProfile,
                                      controller.userListData[0]),
                                  Accounts(contextProfile,
                                      controller.userListData[0]),
                                  Sejarahukm(contextProfile,
                                      controller.userListData[0])
                                ],
                              )
                            ],
                          ),
                        )
                      : Container()),
                ),
              ),
            ));
      },
    );
  }

  Widget Sosialmedia(BuildContext contextProfile) {
    return Container(
      margin: const EdgeInsets.only(left: 40, right: 20, top: 20, bottom: 40),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      width: 650,
      height: 270,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
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
                const Text(
                  "Sosial media",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                buttonedit(contextProfile),
              ],
            ),
          ),
          const Divider(
            endIndent: 0,
            color: Colors.grey,
            indent: 0,
            height: 20,
          ),
          Container(
            decoration: const BoxDecoration(),
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.all(5),
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 15),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/instagram.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        width: 150,
                        child: Row(
                          children: const [
                            Text(
                              'Instagram',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'hamsi',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 15),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/youtube.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      const SizedBox(
                        width: 150,
                        child: Text(
                          'Youtube',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      const Text(
                        'himpunan mahasiswa',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 15),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/twitter.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      const SizedBox(
                        width: 150,
                        child: Text(
                          'Twitter',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      const Text(
                        'hamisi',
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

  Widget buttonEditPassword(context) {
    return InkWell(onTap: () {
      showDialog<void>(
          context: context,
          barrierDismissible: true, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              content: SizedBox(
                height: 300,
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(children: [
                    const Text(
                      'Reset your password',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'New Password',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'New Password',
                            fillColor: Colors.grey[200],
                            filled: true),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Confirm New Password',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'Confirm New Password',
                            fillColor: Colors.grey[200],
                            filled: true),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              ),
            );
          });
    });
  }

  Widget Accounts(context, Data value) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      width: 650,
      height: 210,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5.0, offset: Offset(0, 1))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Accounts",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Divider(
            endIndent: 0,
            color: Colors.grey,
            indent: 0,
            height: 20,
          ),
          Container(
            decoration: const BoxDecoration(),
            margin: const EdgeInsets.only(left: 30, right: 20, top: 10),
            padding: const EdgeInsets.all(5),
            child: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.person_2,
                        color: AppColors.bluese,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        width: 200,
                        child: const Text(
                          'Username',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Text(
                        value.username ?? "",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.lock_outline,
                        color: AppColors.bluese,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        width: 200,
                        child: const Text(
                          'password',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      const Text(
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

  Widget Sejarahukm(context, Data value) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      width: 650,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
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
                const Text(
                  "Sejarah",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Divider(
            endIndent: 0,
            color: Colors.grey,
            indent: 0,
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.only(right: 10, left: 20),
              child: Text(
                value.history ?? "",
              )),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 20),
            child: InkWell(
                onTap: () {
                  showDialog<void>(
                      context: context,
                      barrierDismissible: true, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: SizedBox(
                            height: 500,
                            width: 800,
                            child: Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: const Icon(Icons.close),
                                  )
                                ],
                              ),
                              const Text(
                                'SEJARAH UKM',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                  width: 750,
                                  child: Text(value.instagram ?? "")),
                            ]),
                          ),
                        );
                      });
                },
                child: const Text(
                  "See more.......",
                  style: TextStyle(color: Colors.blue),
                )),
          )
        ],
      ),
    );
  }

  Widget sosialMedia(context, Data value) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      width: 650,
      height: 250,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
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
                const Text(
                  "Sosial media",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Divider(
            endIndent: 0,
            color: Colors.grey,
            indent: 0,
            height: 20,
          ),
          Container(
            decoration: const BoxDecoration(),
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.all(5),
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 15),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/instagram.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        width: 150,
                        child: Row(
                          children: [
                            Text(
                              "Instagram",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        value.instagram ?? "",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 15),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/youtube.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      const SizedBox(
                        width: 150,
                        child: Text(
                          'Youtube',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Text(
                        value.youtube ?? "",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 15),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/twitter.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      const SizedBox(
                        width: 150,
                        child: Text(
                          'Twitter',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Text(
                        value.twitter ?? "",
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
                content: SizedBox(
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
                          child: const Icon(Icons.close),
                        )
                      ],
                    ),
                    const Text(
                      'Sosial Media',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'instagram',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'instagram',
                            fillColor: Colors.grey[200],
                            filled: true),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Youtube',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'your youtube',
                            fillColor: Colors.grey[200],
                            filled: true),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
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
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.blue),
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
        padding:
            const EdgeInsets.only(right: 20, left: 20, bottom: 10, top: 10),
        decoration: BoxDecoration(
          color: AppColors.bilu,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Text('Edit', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget profile(context, Data value, controller) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
          width: 600,
          height: AppSize.screenHeight,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey, blurRadius: 5.0, offset: Offset(0, 1))
              ]),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 600,
                    height: 200,
                    decoration: const BoxDecoration(
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
                          margin: const EdgeInsets.only(top: 10),
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(150),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://tse4.mm.bing.net/th?id=OIP.v2EJ6yhWzDCJ_v6qIXWlrgHaHa&pid=Api&P=0&h=180'),
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
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "HAMISI",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      value.organizationName ?? "",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(shape: BoxShape.rectangle),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 300,
                              child: Text(
                                'Phone',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Text(
                              value.contactNumber ?? "",
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        const Divider(
                          endIndent: 30,
                          color: Colors.grey,
                          indent: 0,
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 300,
                              child: Text(
                                'Email',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Text(
                              value.email ?? "",
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        const Divider(
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
              const SizedBox(
                height: 20,
              ),
              buttonEdit(context, controller, 0, value)
            ],
          ),
        ),
      ],
    );
  }

  Widget buttonEdit(context, ProfileController controller, index, Data value) {
    return InkWell(
      onTap: () {
        controller.nameTextController.text = value.organizationName ?? "";
        controller.emailTextController.text = value.email ?? "";
        controller.usernameTextController.text = value.username ?? "";
        controller.passwordTextController.text = value.password ?? "";
        controller.igTextController.text = value.instagram ?? "";
        controller.twitterTextController.text = value.twitter ?? "";
        controller.phoneNumberTextController.text = value.contactNumber ?? "";
        controller.youtubeTextController.text = value.youtube ?? "";
        controller.shortNameTextController.text = value.shortName ?? "";
        showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: SizedBox(
                  width: 520,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                                controller.nameTextController.text = "";
                                controller.emailTextController.text = "";
                                controller.usernameTextController.text = "";
                                controller.passwordTextController.text = "";
                                controller.igTextController.text = "";
                                controller.twitterTextController.text = "";
                                controller.phoneNumberTextController.text = "";
                                controller.youtubeTextController.text = "";
                                controller.shortNameTextController.text = "";
                              },
                              child: Container(
                                child: const Icon(Icons.close),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Full name'),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 520,
                              child: TextField(
                                controller: controller.nameTextController,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'First name',
                                    labelText: 'First name'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: 520,
                              child: TextField(
                                controller: controller.shortNameTextController,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'Short name',
                                    labelText: 'Short name'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Email address'),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 520,
                              child: TextField(
                                controller: controller.emailTextController,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Email address',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 250,
                              child: TextField(
                                controller: controller.usernameTextController,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'Username',
                                    labelText: 'Username'),
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              child: TextField(
                                controller: controller.passwordTextController,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'Password',
                                    labelText: 'Password'),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Sosial media'),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 250,
                                  child: TextField(
                                    controller: controller.igTextController,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.blue),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        hintText: 'Instagram',
                                        labelText: 'Instagram'),
                                  ),
                                ),
                                SizedBox(
                                  width: 250,
                                  child: TextField(
                                    controller:
                                        controller.youtubeTextController,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.blue),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        hintText: 'Youtube',
                                        labelText: 'Youtube'),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 250,
                              child: TextField(
                                controller: controller.twitterTextController,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'Twitter',
                                    labelText: 'Twitter'),
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              child: TextField(
                                controller:
                                    controller.phoneNumberTextController,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'phone',
                                    labelText: 'Phone'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 520,
                          child: TextFormField(
                            minLines: 9,
                            maxLines: 10,
                            decoration: InputDecoration(
                              hintText: 'Sejarah',
                              labelText: 'Sejarah',
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            controller.updateUsersManagementData(value.id);
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                right: 20, left: 20, bottom: 10, top: 10),
                            decoration: BoxDecoration(
                              color: AppColors.bilu,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Text('Submit',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      },
      child: Container(
        width: 100,
        height: 50,
        margin: EdgeInsets.all(30),
        padding: const EdgeInsets.only(bottom: 8, top: 8, left: 13, right: 13),
        decoration: BoxDecoration(
          color: AppColors.bilu,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(children: const [
          Icon(
            Icons.edit,
            size: 15,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Edit',
            style: TextStyle(color: Colors.white, fontSize: 15),
          )
        ]),
      ),
    );
  }
}
