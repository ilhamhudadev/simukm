import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        return Scaffold(
          backgroundColor: AppColors.greywhite,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  //padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Achievement UKM',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        child: pop1(context, 'title'),
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
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2.0,
                                offset: Offset(0, 1))
                          ]),
                      margin: EdgeInsets.only(bottom: 5, left: 20, right: 20),
                      child: Row(
                        children: [
                          Container(
                            width: AppSize.screenWidth * 0.5,
                            child: TextField(
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
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                FutureBuilder<List<AchievemenModel>>(
                    future: controller.futureWilayah(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var value = snapshot.data;

                        return Container(
                            width: AppSize.screenWidth * 3,
                            decoration: BoxDecoration(color: Color(0xFFE9E8E8)),
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                controller: controller.scrollController,
                                shrinkWrap: true,
                                itemCount: value!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [item(value, index, context)],
                                  );
                                }));
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })
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
        padding: EdgeInsets.only(right: 20, left: 20, bottom: 15, top: 15),
        decoration: BoxDecoration(
          color: AppColors.bilu,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
        ),
        child: Row(
          children: [
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

  Widget item(List<AchievemenModel> value, index, BuildContext context) {
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
                            children: [
                              Container(
                                  child: Image(
                                      height: 50,
                                      width: 50,
                                      image: NetworkImage(
                                          'https://cdn-icons-png.flaticon.com/128/216/216863.png'))),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${value[index].id}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${value[index].kecamatan}',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                          Container(
                            width: 300,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${value[index].kota}',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 200,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${value[index].lat}',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 200,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.lock_clock,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${value[index].lon}',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            endIndent: 0,
                            color: Colors.black,
                            indent: 0,
                            height: 15,
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
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  child: edit(context, 'title'),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  child: hapus(context, 'title'),
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

  Widget hapus(context, title) {
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
                        padding: EdgeInsets.only(left: 325),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(Icons.close)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Do you want to delete this Achievement?',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: AppSize.screenHeight * 0.04,
                              width: AppSize.screenWidth * 0.09,
                              decoration: BoxDecoration(
                                color: AppColors.bilu,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text('Yes',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.5))),
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: AppSize.screenHeight * 0.04,
                              width: AppSize.screenWidth * 0.09,
                              decoration: BoxDecoration(
                                color: AppColors.bilu,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
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
          padding: EdgeInsets.only(bottom: 8, top: 8, left: 13, right: 13),
          decoration: BoxDecoration(
              color: AppColors.bilu,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(5, 5))
              ]),
          child: Row(
            children: [
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

  Widget edit(context, title) {
    return InkWell(
      onTap: () {
        showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Container(
                  height: 550,
                  width: 550,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 525),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Icon(Icons.close)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text(
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
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Keterangan Prestasi'),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 600,
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.description),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Keterangan Prestasi',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sumber Prestasi'),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 600,
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.source),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Sumber Prestasi',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Tanggal Prestasi'),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 600,
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.calendar_month),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Tanggal Prestasi',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Waktu Prestasi'),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 600,
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock_clock),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Waktu Prestasi',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Tempat Prestasi'),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 600,
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.location_city),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Tempat Prestasi',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Dokumentasil'),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 600,
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.photo),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Dokumentasi',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    height: AppSize.screenHeight * 0.04,
                                    width: AppSize.screenWidth * 0.17,
                                    decoration: BoxDecoration(
                                      color: AppColors.bilu,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Save Changes',
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
        padding: EdgeInsets.only(bottom: 8, top: 8, left: 13, right: 13),
        decoration: BoxDecoration(
            color: AppColors.bilu,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(5, 5))
            ]),
        child: Row(
          children: [
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
                  content: Container(
                      height: 550,
                      width: 750,
                      child: SingleChildScrollView(
                          child: Column(children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 725),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Icon(Icons.close)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  'Politeknik Piksi Ganesha crowned champions for Novice First Best Speaker in Asian English Olympics 2018',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 3),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 200,
                                width: 200,
                                child: Image(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://cdn-icons-png.flaticon.com/128/4048/4048675.png')),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Deskripsi Kegiatan:',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Politeknik Piksi Ganesha Debate Society has made us very proud to be crowned champions of the Asian English Olympics (AEO) in the debate division. This is a much-coveted win at the AEO hosted by BINUS University in Indonesia and attended by several prominent institutions in Asia.',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'This prestigious competition is a series of English language-related challenges that assess students’ abilities in different forms of spoken and written English and also puts their critical thinking and communication skills to the test. Our students distinguished themselves in several of the challenges. ',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ]))));
            });
      },
      child: Container(
          padding: EdgeInsets.only(bottom: 8, top: 8, left: 13, right: 13),
          decoration: BoxDecoration(
              color: AppColors.bilu,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(5, 5))
              ]),
          child: Row(
            children: [
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

  Widget pop1(context, title) {
    return InkWell(
      onTap: () {
        showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                  content: Container(
                height: 550,
                width: 550,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 525),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(Icons.close)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
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
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Keterangan Prestasi'),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 600,
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.description),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Keterangan Prestasi',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sumber Prestasi'),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 600,
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.source),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Sumber Prestasi',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tanggal Prestasi'),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 600,
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.calendar_month),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Tanggal Prestasi',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Waktu Prestasi'),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 600,
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_clock),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Waktu Prestasi',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tempat Prestasi'),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 600,
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.location_city),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Tempat Prestasi',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dokumentasil'),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 600,
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.photo),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Dokumentasi',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: AppSize.screenHeight * 0.04,
                                  width: AppSize.screenWidth * 0.17,
                                  decoration: BoxDecoration(
                                    color: AppColors.bilu,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Save Changes',
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
              ));
            });
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
          padding: EdgeInsets.only(bottom: 8, top: 8, left: 13, right: 13),
          decoration: BoxDecoration(
              color: AppColors.bilu,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 10,
                    spreadRadius: 3,
                    offset: Offset(5, 5))
              ]),
          child: Row(
            children: [
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
