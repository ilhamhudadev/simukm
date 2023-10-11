import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_color.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/module/ab/profileukm/controller/report_controller.dart';

class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetBuilder<ReportController>(
        init: ReportController(),
        builder: (ReportController controller) {
          return Scaffold(
            backgroundColor: Color(0xFFE9E8E8),
            body: SingleChildScrollView(
                child: Center(
              child: Column(children: [
                Container(
                  height: 150,
                  width: AppSize.screenWidth * 3,
                  decoration: BoxDecoration(color: Color(0xFFE9E8E8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: 20, left: 20, right: 20, bottom: 20),
                            child: Text(
                              'Laporan Penanggung jawaban  ',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          buttonAdd(context)
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
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 1.0,
                                      offset: Offset(0, 1))
                                ]),
                            margin:
                                EdgeInsets.only(bottom: 5, left: 20, right: 20),
                            child: Row(
                              children: [
                                Container(
                                  width: AppSize.screenWidth * 2.3,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(left: 10),
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
                    ],
                  ),
                ),
                Container(
                    constraints: BoxConstraints(minHeight: 0),
                    width: AppSize.screenWidth * 3,
                    decoration: BoxDecoration(color: Color(0xFFE9E8E8)),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 17,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1.5,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Center(child: item(context));
                      },
                    )),
              ]),
            )),
          );
        });
  }

  Widget buttonAdd(context) {
    return InkWell(
      onTap: () {
        showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Container(
                  height: 400,
                  width: 300,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                                child: Icon(Icons.close),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'File ',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: 200,
                            width: 200,
                            child: Image(
                                image: AssetImage(
                              'assets/upload.png',
                            ))),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                              width: 200,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: AppColors.bilu,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.upload,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Uploud file',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      },
      child: Container(
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.only(right: 15, left: 10, bottom: 15, top: 15),
        decoration: BoxDecoration(
          color: AppColors.bilu,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Icon(
              Icons.add,
              size: 15,
              color: Colors.white,
            ),
            Text(
              'Create',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
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
            Text(
              'Search',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  Widget item(BuildContext context) {
    return Container(
      width: 400,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hut Kemerdekaan 78',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '27 juli 2023',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Politeknik piksi ganesha',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              seemore(context),
              SizedBox(
                width: 5,
              ),
             Edit(context),
              SizedBox(
                width: 5,
              ),
              buttondelete(context),
            ],
          )
        ],
      ),
    );
  }

  Widget buttondelete(BuildContext context) {
    return MaterialButton(
      minWidth: 50,
      height: 40,
      color: AppColors.bilu,
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Row(
                  children: [
                    Icon(
                      Icons.warning,
                      color: Colors.yellow[200],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Are you sure to delete '),
                  ],
                ),
                actions: [
                  MaterialButton(
                    onPressed: () {},
                    color: AppColors.bilu,
                    child: Text('Yes'),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Text('No'),
                  )
                ],
              );
            });
      },
      child: Row(children: [
        Icon(
          Icons.delete,
          size: 12,
          color: Colors.white,
        ),
        Text(
          'Delete',
          style: TextStyle(color: Colors.white, fontSize: 13),
        )
      ]),
    );
  }

  Widget seemore(context) {
    return InkWell(
      onTap: () {
        showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Container(
                  height: 400,
                  width: 300,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                                child: Icon(Icons.close),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'File ',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: 200,
                            width: 200,
                            child: Image(image: AssetImage('assets/pdf.jpg'))),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            width: 200,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: AppColors.bilu,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.download,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Download',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              );
            });
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 9.5, top: 9.5, left: 12, right: 12),
        decoration: BoxDecoration(
          color: AppColors.bilu,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Row(children: [
          Icon(
            Icons.remove_red_eye,
            size: 15,
            color: Colors.white,
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            'See more',
            style: TextStyle(color: Colors.white, fontSize: 13),
          )
        ]),
      ),
    );
  }

  Widget Edit(context) {
    return InkWell(
      onTap: () {
        showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Container(
                  height: 400,
                  width: 300,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                                child: Icon(Icons.close),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Update File  ',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: 200,
                            width: 200,
                            child: Image(
                                image: AssetImage(
                              'assets/upload.png',
                            ))),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                              width: 200,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: AppColors.bilu,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.upload,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Update file',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 9.5, top: 9.5, left: 12, right: 12),
        decoration: BoxDecoration(
          color: AppColors.bilu,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Row(children: [
          Icon(
            Icons.edit,
            size: 15,
            color: Colors.white,
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            'Edit',
            style: TextStyle(color: Colors.white, fontSize: 13),
          )
        ]),
      ),
    );
  }
}
