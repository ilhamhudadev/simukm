import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/globalcontroller/app_function.dart';
import 'package:standard_project/module/ac/achievement/controller/achievement_controller.dart';
import 'package:standard_project/core/style/app_color.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/module/ac/achievement/data/model/achievement_management.dart';
import 'package:standard_project/module/ac/achievement/data/model/achievement_model.dart';

class AchievementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetBuilder<AchievementController>(
      init: AchievementController(),
      builder: (AchievementController controller) {
        controller.getAchievementLetter();
        return Scaffold(
          backgroundColor: AppColors.greybegroud,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  //padding: EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Achievement UKM',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2.0,
                                offset: Offset(0, 1))
                          ]),
                      margin:
                          const EdgeInsets.only(bottom: 5, left: 20, right: 20),
                      child: Row(
                        children: [
                          SizedBox(
                            width: AppSize.screenWidth * 0.5,
                            child: const TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10),
                                  hintText: "Search a listing",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          bottomLeft: Radius.circular(5)),
                                      borderSide: BorderSide())),
                            ),
                          ),
                          buttonsearch()
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    buttonAdd(context, "", controller)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => Container(
                    width: AppSize.screenWidth * 3,
                    decoration: const BoxDecoration(color: Color(0xFFE9E8E8)),
                    child: controller.achievementData.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            controller: controller.scrollController,
                            shrinkWrap: true,
                            itemCount: controller.achievementData.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  item(controller.achievementData, index,
                                      context, controller)
                                ],
                              );
                            })
                        : Container()))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buttonsearch() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding:
            const EdgeInsets.only(right: 20, left: 20, bottom: 15, top: 15),
        decoration: const BoxDecoration(
          color: AppColors.bilu,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
        ),
        child: Row(
          children: const [
            Icon(
              Icons.search,
              size: 20,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Search',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  Widget item(List<DataAchievement> value, index, BuildContext context,
      AchievementController controller) {
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
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child: const Image(
                                      height: 50,
                                      width: 50,
                                      image: NetworkImage(
                                          'https://cdn-icons-png.flaticon.com/128/216/216863.png'))),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${value[index].achievementTitle}',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${value[index].achievementDetails}',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_pin,
                                      size: 20,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${value[index].achievementLocation}',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_month,
                                      size: 20,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${value[index].achievementDate}',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.verified_user,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '${value[index].shortName}',
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          const Divider(
                            endIndent: 0,
                            color: Colors.black,
                            indent: 0,
                            height: 15,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  alignment: Alignment.topRight,
                                  child: seemore(context, 'title'),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  child: edit(context, 'title', value[index],
                                      controller),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  child: hapus(
                                    context,
                                    'title',
                                    value[index],
                                    controller,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ])),
      ],
    );
  }

  Widget hapus(context, title, value, AchievementController controller) {
    return InkWell(
      onTap: () {
        showDialog<void>(
            context: context,
            barrierDismissible: true, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                content: Container(
                  height: 140,
                  width: 230,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 325),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Icon(Icons.close)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Do you want to delete this Achievement?',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.deleteAchievementData(value.id);
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: AppSize.screenHeight * 0.04,
                              width: AppSize.screenWidth * 0.09,
                              decoration: BoxDecoration(
                                color: AppColors.bilu,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                  child: Text('Yes',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.5))),
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: AppSize.screenHeight * 0.04,
                              width: AppSize.screenWidth * 0.09,
                              decoration: BoxDecoration(
                                color: AppColors.bilu,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                  child: Text('No',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.5))),
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
              const EdgeInsets.only(bottom: 8, top: 8, left: 13, right: 13),
          decoration: BoxDecoration(
              color: AppColors.bilu,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(5, 5))
              ]),
          child: Row(
            children: const [
              Icon(
                Icons.delete,
                size: 10,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Delete',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          )),
    );
  }

  Widget edit(
      context, title, DataAchievement value, AchievementController controller) {
    return InkWell(
      onTap: () {
        controller.userIdTextController.text = value.userId ?? "";
        controller.achievementDateTextController.text =
            value.achievementDate ?? "";
        controller.achievementTitleTextController.text =
            value.achievementTitle ?? "";
        controller.achievementDetailsTextController.text =
            value.achievementDetails ?? "";
        controller.achievementLocationTextController.text =
            value.achievementLocation ?? "";
        controller.documentationTextController.text = value.documentation ?? "";

        showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: SizedBox(
                  height: 550,
                  width: 550,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 525),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: const Icon(Icons.close)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: const Text(
                                'Form Achievement UKM',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Keterangan Prestasi'),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 600,
                              child: TextField(
                                controller:
                                    controller.achievementDetailsTextController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.description),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Keterangan Prestasi',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Judul Prestasi'),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 600,
                              child: TextField(
                                controller:
                                    controller.achievementTitleTextController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.description),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Judul Prestasi',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Tanggal Prestasi'),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 600,
                              child: TextField(
                                onTap: () async {
                                  String selectedDate =
                                      await selectDate(context);
                                  controller.achievementDateTextController
                                      .text = selectedDate;
                                },
                                controller:
                                    controller.achievementDateTextController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.calendar_month),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Tanggal Prestasi',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Tempat Prestasi'),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 600,
                              child: TextField(
                                controller: controller
                                    .achievementLocationTextController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.location_city),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Tempat Prestasi',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Dokumentasil'),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 600,
                              child: TextField(
                                controller:
                                    controller.documentationTextController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.photo),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Dokumentasi',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.updateAchievementData(value.id);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    height: AppSize.screenHeight * 0.04,
                                    width: AppSize.screenWidth * 0.17,
                                    decoration: BoxDecoration(
                                      color: AppColors.bilu,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Center(
                                        child: Text(
                                      'Submit',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 11.5),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(5, 5))
            ]),
        child: Row(
          children: const [
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
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget seemore(context, title) {
    return InkWell(
      onTap: () {
        showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                  content: SizedBox(
                      height: 550,
                      width: 750,
                      child: SingleChildScrollView(
                          child: Column(children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 725),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: const Icon(Icons.close)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            children: [
                              Container(
                                child: const Text(
                                  'Politeknik Piksi Ganesha crowned champions for Novice First Best Speaker in Asian English Olympics 2018',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 3),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 200,
                                width: 200,
                                child: const Image(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://cdn-icons-png.flaticon.com/128/4048/4048675.png')),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    'Deskripsi Kegiatan:',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Politeknik Piksi Ganesha Debate Society has made us very proud to be crowned champions of the Asian English Olympics (AEO) in the debate division. This is a much-coveted win at the AEO hosted by BINUS University in Indonesia and attended by several prominent institutions in Asia.',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'This prestigious competition is a series of English language-related challenges that assess students’ abilities in different forms of spoken and written English and also puts their critical thinking and communication skills to the test. Our students distinguished themselves in several of the challenges. ',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ]))));
            });
      },
      child: Container(
          padding:
              const EdgeInsets.only(bottom: 8, top: 8, left: 13, right: 13),
          decoration: BoxDecoration(
              color: AppColors.bilu,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(5, 5))
              ]),
          child: Row(
            children: const [
              Icon(
                Icons.remove_red_eye,
                size: 10,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'See more',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          )),
    );
  }

  Widget buttonAdd(context, title, AchievementController controller) {
    return InkWell(
      onTap: () {
        controller.userIdTextController.text = "";
        controller.achievementDateTextController.text = "";
        controller.achievementTitleTextController.text = "";
        controller.achievementDetailsTextController.text = "";
        controller.achievementLocationTextController.text = "";
        controller.documentationTextController.text = "";

        showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: SizedBox(
                  height: 550,
                  width: 550,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 525),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: const Icon(Icons.close)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: const Text(
                                'Form Achievement UKM',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Keterangan Prestasi'),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 600,
                              child: TextField(
                                controller:
                                    controller.achievementDetailsTextController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.description),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Keterangan Prestasi',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Judul Prestasi'),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 600,
                              child: TextField(
                                controller:
                                    controller.achievementTitleTextController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.description),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Judul Prestasi',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Tanggal Prestasi'),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 600,
                              child: TextField(
                                onTap: () async {
                                  String selectedDate =
                                      await selectDate(context);
                                  controller.achievementDateTextController
                                      .text = selectedDate;
                                },
                                controller:
                                    controller.achievementDateTextController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.calendar_month),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Tanggal Prestasi',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Tempat Prestasi'),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 600,
                              child: TextField(
                                controller: controller
                                    .achievementLocationTextController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.location_city),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Tempat Prestasi',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Dokumentasi'),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 600,
                              child: TextField(
                                controller:
                                    controller.documentationTextController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.photo),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Dokumentasi',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.insertAchievementData();
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    height: AppSize.screenHeight * 0.04,
                                    width: AppSize.screenWidth * 0.17,
                                    decoration: BoxDecoration(
                                      color: AppColors.bilu,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Center(
                                        child: Text(
                                      'Submit',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 11.5),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
          margin: const EdgeInsets.only(right: 20),
          padding:
              const EdgeInsets.only(right: 15, left: 10, bottom: 15, top: 15),
          decoration: BoxDecoration(
            color: AppColors.bilu,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: const [
              Icon(
                Icons.add,
                size: 15,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Add',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          )),
    );
  }
}
