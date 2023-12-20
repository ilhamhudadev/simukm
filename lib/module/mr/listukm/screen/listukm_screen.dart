import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_color.dart';
import 'package:standard_project/core/style/app_size.dart';
//import 'package:standard_project/core/style/app_color.dart';
import 'package:standard_project/module/mr/listukm/data/model/userlistukm.dart';
import 'package:standard_project/module/mr/listukm/controller/listukm_controller.dart';

class ListukmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetBuilder<ListukmController>(
        init: ListukmController(),
        builder: (ListukmController controller) {
          return Scaffold(
              backgroundColor: AppColors.greybegroud,
              body: SingleChildScrollView(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.greywhite,
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.greywhite,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10, left: 43),
                                    child: Text('List UKM',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    child: create(context),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                    margin: EdgeInsets.only(
                                        bottom: 5, left: 20, right: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: AppSize.screenWidth * 0.5,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.only(left: 10),
                                                hintText: "Search a listing",
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
                                        buttonsearch()
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 5,
                            left: 10,
                          ),
                          height: AppSize.screenHeight,
                          width: AppSize.screenWidth * 2.585,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 233, 232, 232),
                          ),
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: controller.organizationList.length,
                              itemBuilder: (context, index) {
                                return item(controller.organizationList[index],
                                    context);
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
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
          Text(
            'Search',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    ),
  );
}

Widget create(context) {
  return InkWell(
    onTap: () {
      showDialog<void>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                height: 500,
                width: 500,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(Icons.close),
                                ],
                              )),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 35, right: 35, top: 35, bottom: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.add_link,
                                        color: Colors.black, size: 20),
                                    SizedBox(width: 5),
                                    Text(
                                      'Form Create',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Divider(
                                    endIndent: 0,
                                    color: Colors.black,
                                    indent: 0,
                                    height: 20),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 40.0, right: 40.0, bottom: 10.0),
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Logo',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 13,
                                        horizontal:
                                            10), // Ubah padding teks di dalam field
                                    isDense: true,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nama UKM',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 13,
                                        horizontal:
                                            10), // Ubah padding teks di dalam field
                                    isDense: true,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Penanggung Jawab',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 13,
                                        horizontal:
                                            10), // Ubah padding teks di dalam field
                                    isDense: true,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Contact Person',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 13,
                                        horizontal:
                                            10), // Ubah padding teks di dalam field
                                    isDense: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.only(
                                    bottom: 9.5, top: 9.5, left: 12, right: 12),
                                decoration: BoxDecoration(
                                  color: AppColors.bilu,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                    child: Text(
                                  'Create',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                )),
                              ),
                            ),
                          ],
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
      margin: EdgeInsets.only(right: 20, top: 20),
      padding: EdgeInsets.only(right: 15, left: 10, bottom: 15, top: 15),
      decoration: BoxDecoration(
        color: Colors.blueAccent.shade700,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, color: Colors.white, size: 15),
          Text(
            'Create',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      )),
    ),
  );
}

Widget item(ListukmOrganization model, context) {
  return Card(
      child: Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(3),
    ),
    child: ListTile(
        title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("${model.urlfoto}")),
                      borderRadius: BorderRadius.circular(50)),
                ),
                SizedBox(width: 20),
              ],
            )),
        Container(child: Text("${model.nama}")),
        Container(child: Text("${model.pj}")),
        Container(child: Text("${model.tlp}")),
        Container(
          margin: EdgeInsets.only(right: 20),
          child: Row(
            children: [
              edit(context),
              SizedBox(width: 10),
              bottonDelete(context),
            ],
          ),
        ),
      ],
    )),
  ));
}

Widget bottonDelete(context) {
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
                        Icon(Icons.warning),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Are you sure to delete"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom: 5, top: 5, left: 30, right: 30),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            child: Text("Yes"),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom: 5, top: 5, left: 30, right: 30),
                            child: Text("No"),
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
      padding: EdgeInsets.only(bottom: 9.5, top: 9.5, left: 12, right: 12),
      decoration: BoxDecoration(
        color: AppColors.bilu,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(children: [
        Icon(
          Icons.delete,
          size: 15,
          color: Colors.white,
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          'delete',
          style: TextStyle(color: Colors.white, fontSize: 13),
        )
      ]),
    ),
  );
}

Widget edit(context) {
  return InkWell(
    onTap: () {
      showDialog<void>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                height: 500,
                width: 500,
                child: Column(
                  children: [
                    Column(
                      children: [
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.close),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 35, right: 35, top: 35, bottom: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.edit,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      size: 20),
                                  SizedBox(width: 5),
                                  Text(
                                    'Form Edit',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Divider(
                                  endIndent: 0,
                                  color: Colors.black,
                                  indent: 0,
                                  height: 20),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 40.0, right: 40.0, bottom: 10.0),
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Logo',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 13,
                                      horizontal:
                                          10), // Ubah padding teks di dalam field
                                  isDense: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nama UKM',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 13,
                                      horizontal:
                                          10), // Ubah padding teks di dalam field
                                  isDense: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Penanggung Jawab',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 13,
                                      horizontal:
                                          10), // Ubah padding teks di dalam field
                                  isDense: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Contact Person',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 13,
                                      horizontal:
                                          10), // Ubah padding teks di dalam field
                                  isDense: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              height: AppSize.screenHeight * 0.04,
                              width: AppSize.screenWidth * 0.15,
                              decoration: BoxDecoration(
                                color: AppColors.bilu,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Center(
                                  child: Text(
                                'Update',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11.5),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
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
        ),
        child: Row(children: [
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
        ])),
  );
}
