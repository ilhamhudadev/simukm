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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                child: create(context, 'title'),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 6, bottom: 10),
                                width: AppSize.screenWidth * 0.5,
                                height: AppSize.screenHeight * 0.06,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(3)),
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
                              Container(
                                child: InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    height: AppSize.screenHeight * 0.06,
                                    width: AppSize.screenWidth * 0.15,
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent.shade700,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Search',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )),
                                  ),
                                ),
                              )
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
                            return item(
                                controller.organizationList[index], context);
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

Widget create(context, title) {
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
                              child: Icon(Icons.close)),
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
                                height: AppSize.screenHeight * 0.04,
                                width: AppSize.screenWidth * 0.1,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent.shade700,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Center(
                                    child: Text(
                                  'Create',
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
              ),
            );
          });
    },
    borderRadius: BorderRadius.circular(20),
    child: Container(
      margin: EdgeInsets.only(top: 10, right: 33),
      height: AppSize.screenHeight * 0.06,
      width: AppSize.screenWidth * 0.15,
      decoration: BoxDecoration(
        color: Colors.blueAccent.shade700,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, color: Colors.white, size: 13),
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
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          spreadRadius: 1,
        )
      ],
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
        Container(width: 200, child: Text("${model.nama}")),
        Container(width: 200, child: Text("${model.pj}")),
        Container(width: 200, child: Text("${model.tlp}")),
        Container(
          margin: EdgeInsets.only(right: 20),
          child: Row(
            children: [
              edit(context, 'title'),
              SizedBox(height: 20),
              hapus(context, 'title'),
            ],
          ),
        ),
      ],
    )),
  ));
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
                height: 100,
                width: 100,
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.close)),
                    SizedBox(height: 10),
                    Text(
                      'Apakah yakin hapus data?',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: AppSize.screenHeight * 0.04,
                            width: AppSize.screenWidth * 0.06,
                            padding: EdgeInsets.only(left: 4.5),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Row(
                              children: [
                                Center(
                                    child: Text('Yes',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11.5))),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: AppSize.screenHeight * 0.04,
                            width: AppSize.screenWidth * 0.06,
                            padding: EdgeInsets.only(left: 2.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue,
                                  spreadRadius: 1,
                                )
                              ],
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Center(
                                child: Text('No',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 11.5))),
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
    borderRadius: BorderRadius.circular(20),
    child: Container(
      height: AppSize.screenHeight * 0.05,
      width: AppSize.screenWidth * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Icon(Icons.delete)),
    ),
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
                            child: Icon(Icons.close)),
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
                                color: Colors.blue,
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
    borderRadius: BorderRadius.circular(20),
    child: Container(
        margin: EdgeInsets.all(20),
        height: AppSize.screenHeight * 0.05,
        width: AppSize.screenWidth * 0.1,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Icon(Icons.edit))),
  );
}
