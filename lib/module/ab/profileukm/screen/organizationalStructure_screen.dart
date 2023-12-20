import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_color.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/module/ab/profileukm/controller/organizationalStructure_controller.dart';
import 'package:standard_project/module/ab/profileukm/data/model/structure_model.dart';

class OrganizationalStruktureScreen extends StatelessWidget {
  get index => null;

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetBuilder<OrganizationStrukturController>(
        init: OrganizationStrukturController(),
        builder: (OrganizationStrukturController controller) {
          controller.getStructureLetter();
          return Scaffold(
            backgroundColor: AppColors.greybegroud,
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
                                'Struktur Organisasi ',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
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
                                        blurRadius: 1.0,
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
                                          hintText: "Cari Struktur",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(5)),
                                              borderSide: BorderSide())),
                                    ),
                                  ),
                                  buttonsearch()
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
                  Obx(() => Container(
                      constraints: BoxConstraints(minHeight: 0),
                      width: AppSize.screenWidth * 3,
                      decoration: BoxDecoration(color: Color(0xFFE9E8E8)),
                      child: controller.structureData.isNotEmpty
                          ? ListView.builder(
                              scrollDirection: Axis.vertical,
                              controller: controller.scrollController,
                              shrinkWrap: true,
                              itemCount: controller.structureData.length,
                              itemBuilder: (context, index) {
                                return item(
                                    controller.structureData, index, context);
                              },
                            )
                          : Container()))
                ]),
              ),
            ),
          );
        });
  }

  Widget item(List<DataStructure> value, int index, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Container(
        child: Row(
          children: [
            Row(
              children: [
                Icon(Icons.calendar_month),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '2020/2021 ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              width: 150,
              child: Column(
                children: [
                  Text(
                    'Pembimbing',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    ' ${value[index].adviser}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
            Container(
              width: 150,
              child: Column(
                children: [
                  Text(
                    'Chairman',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${value[index].president}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
            Container(
              width: 150,
              child: Column(
                children: [
                  Text(
                    'Vice chairman',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    ' ${value[index].vicePresident}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  seemore(
                    context,
                    value,
                    index,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  buttonEdit(context),
                  SizedBox(
                    width: 10,
                  ),
                  bottonDelete(context)
                ],
              ),
            )
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
                  width: 500,
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
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Dosen pembimbing'),
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
                                    hintText: 'Dosen pembimbing',
                                    labelText: 'Dosen pembimbing'),
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
                            Text('Ketua'),
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
                                    hintText: 'Ketua',
                                    labelText: 'Ketua'),
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
                            Text('Wakil Ketua'),
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
                                  hintText: 'Wakil Ketua',
                                ),
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
                            Text('Anggota'),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 520,
                              child: TextFormField(
                                minLines: 4,
                                maxLines: 10,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Anggota',
                                ),
                              ),
                            ),
                          ],
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
                            child: Text('Save',
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
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.only(right: 15, left: 10, bottom: 15, top: 15),
        decoration: BoxDecoration(
          color: AppColors.bilu,
          borderRadius: BorderRadius.circular(15),
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

  Widget buttonEdit(context) {
    return InkWell(
      onTap: () {
        showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Container(
                  height: 600,
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
                                child: Icon(Icons.close),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Dosen pembimbing'),
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
                                    hintText: 'Dosen pembimbing',
                                    labelText: 'Dosen pembimbing'),
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
                            Text('Ketua'),
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
                                    hintText: 'Ketua',
                                    labelText: 'Ketua'),
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
                            Text('Wakil Ketua'),
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
                                  hintText: 'Wakil Ketua',
                                ),
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
                            Text('Anggota'),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 520,
                              child: TextFormField(
                                minLines: 9,
                                maxLines: 10,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Anggota',
                                ),
                              ),
                            ),
                          ],
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
                            child: Text('Save',
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

  Widget seemore(
    context,
    List<DataStructure> value,
    index,
  ) {
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
                          'Struktur Organisasi',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          width: 170,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.circular(5)),
                          child: Container(
                            child: Column(
                              children: [
                                Text('DOSEN PEMBIMBING',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                Container(
                                  height: 1,
                                  width: 100,
                                  color: Colors.black,
                                ),
                                Text("${value[index].adviser.toString()}"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              width: 170,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 1.0),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Container(
                                child: Column(
                                  children: [
                                    Text('KETUA',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Container(
                                      height: 1,
                                      width: 100,
                                      color: Colors.black,
                                    ),
                                    Text(
                                        "${value[index].president.toString()}"),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              width: 170,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 1.0),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Container(
                                child: Column(
                                  children: [
                                    Text('WAKIL KETUA',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Container(
                                      height: 1,
                                      width: 100,
                                      color: Colors.black,
                                    ),
                                    Text(
                                        "${value[index].vicePresident.toString()}"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          width: 500,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.circular(5)),
                          child: Container(
                            child: Column(
                              children: [
                                Text(
                                  'ANGGOTA',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Container(
                                  height: 1,
                                  width: 100,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                    width: 500,
                                    child: Text(
                                      "${value[index].adviser.toString()}",
                                      maxLines: 5,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
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
