import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/core/style/app_color.dart';
import 'package:standard_project/module/me/usermanagement/controller/usermanagement_controller.dart';
import 'package:standard_project/module/me/usermanagement/data/model/users_model.dart';

class UsermanagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext contextUser) {
    final ScrollController scrollControllerV = ScrollController();
    final ScrollController scrollControllerH = ScrollController();
    AppSize().init(contextUser);
    return GetBuilder<UsermanagementController>(
      init: UsermanagementController(),
      builder: (UsermanagementController controller) {
        controller.getUsersManagementData();
        return Scaffold(
            backgroundColor: AppColors.greybegroud,
            body: SingleChildScrollView(
              controller: scrollControllerH,
              // scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                controller: scrollControllerV,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        decoration: const BoxDecoration(
                          color: AppColors.greybegroud,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 20, left: 20, right: 20, bottom: 20),
                                  child: const Text(
                                    'User Management',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 30),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        const BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 1.0,
                                            offset: Offset(0, 1))
                                      ]),
                                  margin: const EdgeInsets.only(
                                    left: 20,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: AppSize.screenWidth * 0.5,
                                        child: const TextField(
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.only(left: 10),
                                              hintText: "Cari User",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(5),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  5)),
                                                  borderSide: BorderSide())),
                                        ),
                                      ),
                                      buttonsearch(controller)
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                buttonAdd(context, controller)
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() => Container(
                          constraints: const BoxConstraints(minHeight: 0),
                          width: AppSize.screenWidth * 3,
                          decoration: const BoxDecoration(
                            color: AppColors.greybegroud,
                          ),
                          child: controller.userListData.isNotEmpty
                              ? ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: controller.userListData.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Center(
                                        child: item(
                                            controller.userListData[index],
                                            context,
                                            controller,
                                            index));
                                  },
                                )
                              : Container())),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  Widget bottonDelete(
      context, UsermanagementController controller, Data value) {
    return InkWell(
      onTap: () {
        showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Container(
                  height: 70,
                  width: 220,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.warning),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("Are you sure to delete"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.deleteUsersManagementData(value.id);
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  bottom: 5, top: 5, left: 30, right: 30),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Text("Yes"),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  bottom: 5, top: 5, left: 30, right: 30),
                              child: const Text("No"),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
      },
      child: Container(
        padding:
            const EdgeInsets.only(bottom: 9.5, top: 9.5, left: 12, right: 12),
        decoration: BoxDecoration(
          color: AppColors.bilu,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(children: [
          const Icon(
            Icons.delete,
            size: 15,
            color: Colors.white,
          ),
          const SizedBox(
            width: 2,
          ),
          const Text(
            'delete',
            style: TextStyle(color: Colors.white, fontSize: 13),
          )
        ]),
      ),
    );
  }

  Widget buttonEdit(
      context, UsermanagementController controller, index, Data value) {
    controller.nameTextController.text = value.organizationName ?? "";
    controller.emailTextController.text = value.email ?? "";
    controller.usernameTextController.text = value.username ?? "";
    controller.passwordTextController.text = value.password ?? "";
    controller.igTextController.text = value.instagram ?? "";
    controller.twitterTextController.text = value.twitter ?? "";
    controller.phoneNumberTextController.text = value.contactNumber ?? "";
    controller.youtubeTextController.text = value.youtube ?? "";
    controller.shortNameTextController.text = value.shortName ?? "";
    return InkWell(
      onTap: () {
        showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: SizedBox(
                  height: 800,
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
                            child: const Text('Save',
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
        padding: const EdgeInsets.only(bottom: 8, top: 8, left: 13, right: 13),
        decoration: BoxDecoration(
          color: AppColors.bilu,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(children: [
          const Icon(
            Icons.edit,
            size: 15,
            color: Colors.white,
          ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            'Edit',
            style: TextStyle(color: Colors.white, fontSize: 15),
          )
        ]),
      ),
    );
  }

  Widget buttonAdd(context, UsermanagementController controller) {
    return InkWell(
      onTap: () {
        showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: SizedBox(
                  height: 800,
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
                        InkWell(
                          onTap: () {
                            controller.insertUsersManagementData();
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                right: 20, left: 20, bottom: 10, top: 10),
                            decoration: BoxDecoration(
                              color: AppColors.bilu,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Text('Save',
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
        margin: const EdgeInsets.only(right: 20),
        padding:
            const EdgeInsets.only(right: 15, left: 10, bottom: 15, top: 15),
        decoration: BoxDecoration(
          color: AppColors.bilu,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.add,
              size: 15,
              color: Colors.white,
            ),
            const SizedBox(width: 5),
            const Text(
              'Create',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonsearch(UsermanagementController controller) {
    return InkWell(
      onTap: () {
        controller.getUsersManagementData();
      },
      child: Container(
        padding:
            const EdgeInsets.only(right: 20, left: 20, bottom: 14, top: 14),
        decoration: const BoxDecoration(
          color: AppColors.bilu,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              size: 20,
              color: Colors.white,
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              'Search',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  Widget item(Data model, context, UsermanagementController controller, index) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          margin:
              const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          // Container(
                          //   margin: EdgeInsets.only(left: 20, right: 20),
                          //   height: 60,
                          //   width: 60,
                          //   decoration: BoxDecoration(
                          //       image: DecorationImage(
                          //           image: NetworkImage("${model.urlAvatar}"),
                          //           fit: BoxFit.contain),
                          //       borderRadius: BorderRadius.circular(0)),
                          // ),
                          SizedBox(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${model.organizationName}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${model.email}",
                                  style:
                                      const TextStyle(color: Color(0xFF6C6B6B)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [],
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Username',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text('${model.email}',
                              style: const TextStyle(color: Color(0xFF6C6B6B))),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${model.email}',
                            style: const TextStyle(color: Color(0xFF6C6B6B)),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        seemore(model, context),
                        const SizedBox(
                          width: 10,
                        ),
                        buttonEdit(context, controller, index, model),
                        const SizedBox(
                          width: 10,
                        ),
                        bottonDelete(context, controller, model)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget seemore(Data model, context) {
    return InkWell(
      onTap: () {
        showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: SizedBox(
                  height: 200,
                  width: 100,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              child: const Icon(Icons.close),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Sosial Media",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/instagram.png'))),
                          ),
                          Text(
                            '${model.instagram}',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/youtube.png'))),
                          ),
                          Text(
                            '${model.youtube}',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/twitter.png'))),
                          ),
                          Text(
                            '${model.twitter}',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
      },
      child: Container(
        padding:
            const EdgeInsets.only(bottom: 9.5, top: 9.5, left: 12, right: 12),
        decoration: BoxDecoration(
          color: AppColors.bilu,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(children: [
          const Icon(
            Icons.remove_red_eye,
            size: 13,
            color: Colors.white,
          ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            'See more',
            style: TextStyle(color: Colors.white, fontSize: 13),
          )
        ]),
      ),
    );
  }
}
