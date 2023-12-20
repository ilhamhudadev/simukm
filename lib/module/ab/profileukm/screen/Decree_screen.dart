import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_color.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/module/ab/profileukm/controller/Decree_controller.dart';
import 'package:standard_project/module/ab/profileukm/data/model/decision_letter_model.dart';

class DecreeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetBuilder<DecreeController>(
        init: DecreeController(),
        builder: (DecreeController controller) {
          controller.getDecisionLetter();
          return Scaffold(
            backgroundColor: AppColors.greybegroud,
            body: SingleChildScrollView(
                child: Center(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(color: Color(0xFFE9E8E8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              //    color: Color(0xFFEEEEEE),
                              margin: EdgeInsets.only(
                                  top: 20, left: 20, right: 20, bottom: 20),
                              child: Text(
                                'Surat Keputusan ',
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
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 2.0,
                                        offset: Offset(0, 1))
                                  ]),
                              margin: EdgeInsets.only(
                                left: 20,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: AppSize.screenWidth * 0.5,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(left: 10),
                                          hintText: "Cari SK Kepengurusan",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(5)),
                                              borderSide: BorderSide())),
                                    ),
                                  ),
                                  buttonsearch(),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            buttonAdd(context)
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(() => controller.decisionLetterData.isNotEmpty
                      ? Container(
                          // padding: EdgeInsets.all(20),
                          constraints: BoxConstraints(minHeight: 0),
                          width: AppSize.screenWidth * 4,
                          decoration: BoxDecoration(
                            color: Color(0xFFE9E8E8),
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            controller: controller.scrollController,
                            shrinkWrap: true,
                            itemCount: controller.decisionLetterData.length,
                            itemBuilder: (context, index) {
                              return item(controller.decisionLetterData, index,
                                  context);
                            },
                          ))
                      : Container())
                ],
              ),
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
                  height: 500,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Tanggal SK'),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 520,
                              child: TextField(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'Tanggal SK',
                                    labelText: 'Tanggal SK'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('No SK'),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 520,
                              child: TextField(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'No SK',
                                    labelText: 'No SK'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Judul SK'),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 520,
                              child: TextField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Judul SK',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Link Dokumen'),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 520,
                              child: TextField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Link Dokumen',
                                ),
                              ),
                            ),
                          ],
                        ),
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
                                    Icons.add,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Add',
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
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  offset: Offset(
                    0,
                    1,
                  ))
            ]),
        child: Row(
          children: [
            Icon(
              Icons.add,
              size: 15,
              color: Colors.white,
            ),
            SizedBox(width: 5),
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
        padding: EdgeInsets.only(right: 20, left: 20, bottom: 14, top: 14),
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

  Widget item(List<DataDecision> value, int index, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Container(
        padding: EdgeInsets.only(right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/documen.png'))),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 150,
                  child: Text(
                    '2021/2022',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'No SK ',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${value[index].decisionNumber}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Judul SK', style: TextStyle(fontSize: 14)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${value[index].decisionTitle}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tanggal SK ', style: TextStyle(fontSize: 14)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${value[index].decisionDate} ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      seemore(context),
                      SizedBox(
                        width: 5,
                      ),
                      buttonEdit(context),
                      SizedBox(
                        width: 5,
                      ),
                      bottonDelete(context)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buttonEdit(context) {
    return InkWell(
      onTap: () {
        showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Container(
                  height: 500,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Tanggal SK'),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 520,
                              child: TextField(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'Tanggal SK',
                                    labelText: 'Tanggal SK'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('No SK'),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 520,
                              child: TextField(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'No SK',
                                    labelText: 'No SK'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Judul SK'),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 520,
                              child: TextField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Judul SK',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Link Dokumen'),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 520,
                              child: TextField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Link Dokumen',
                                ),
                              ),
                            ),
                          ],
                        ),
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
                                    Icons.edit,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Update',
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
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(children: [
          Icon(
            Icons.edit,
            size: 13,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Edit',
            style: TextStyle(color: Colors.white, fontSize: 13),
          )
        ]),
      ),
    );
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
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(children: [
          Icon(
            Icons.remove_red_eye,
            size: 13,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'See more',
            style: TextStyle(color: Colors.white, fontSize: 13),
          )
        ]),
      ),
    );
  }
}
