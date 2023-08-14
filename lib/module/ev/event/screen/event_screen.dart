import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/core/style/app_color.dart';
import 'package:standard_project/module/ev/event/controller/event_controller.dart';
import 'package:standard_project/module/ev/event/data/model/userevent.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetBuilder<EventController>(
        init: EventController(),
        builder: (EventController controller) {
          return Scaffold(
              body: Container(
            width: AppSize.screenWidth * 1000,
            height: AppSize.screenHeight,
            color: AppColors.bg,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: 40, bottom: 40, left: 48, right: 40),
                      child: Text(
                        'Kegiatan Mahasiswa',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(7.0),
                      height: AppSize.screenHeight * 0.04,
                      width: 250,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide())),
                      ),
                    ),
                    Container(
                      child: add(context, 'title'),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(
                      top: 5,
                      left: 20,
                    ),
                    height: AppSize.screenHeight * 0.81,
                    width: AppSize.screenWidth * 2.6,
                    decoration: BoxDecoration(
                      color: AppColors.bg,
                    ),
                    child: GridView.builder(
                      itemCount: controller.organizationList.length,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, childAspectRatio: 1.4),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(children: [
                          item(controller.organizationList[index], context)
                        ]);
                      },
                    ))
              ],
            ),
          ));
        });
  }
}

Widget add(context, title) {
  return InkWell(
    onTap: () {
      showDialog<void>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                height: 550,
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
                                      'Form Add',
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
                                  'No',
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
                                  'Nama Kegiatan',
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
                                  'Jenis Kegiatan',
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
                                  'Waktu Pelaksanaan',
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
                                  'Tempat Kegiatan',
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
                                  'Jumlah Peserta',
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
                                  'Dokumentasi',
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
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Center(
                                    child: Text(
                                  'Add',
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
      margin: EdgeInsets.all(20),
      height: AppSize.screenHeight * 0.04,
      width: AppSize.screenWidth * 0.1,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_box, color: Colors.white, size: 13),
          Text(
            'Add',
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
        ],
      )),
    ),
  );
}

Widget item(EventOrganization model, context) {
  return Container(
    padding: EdgeInsets.all(19),
    margin: EdgeInsets.only(left: 12, right: 12, bottom: 12),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(7)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: AppSize.screenHeight * 0.027,
              width: AppSize.screenWidth * 0.1,
              padding: EdgeInsets.only(left: 4, top: 3.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue,
                    spreadRadius: 1,
                  )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("${model.no}",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 8.5,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 7),
            Text("${model.nama}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("${model.waktu}",
                style: TextStyle(color: Colors.grey, fontSize: 11.0)),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.class_sharp, color: Colors.black, size: 13),
                SizedBox(width: 5),
                Text("${model.jenis}",
                    style: TextStyle(color: Colors.black, fontSize: 13.0)),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.black, size: 13.0),
                SizedBox(width: 5),
                Text("${model.tempat}",
                    style: TextStyle(color: Colors.black, fontSize: 13.0)),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.people, color: Colors.black, size: 13),
                SizedBox(width: 5),
                Text("${model.jumlah}",
                    style: TextStyle(color: Colors.black, fontSize: 13.0)),
              ],
            )
          ],
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(children: [
              Container(
                alignment: Alignment.topRight,
                child: edit(context, 'title'),
              ),
              SizedBox(width: 10),
              Container(
                alignment: Alignment.topRight,
                child: hapus(context, 'title'),
              ),
              SizedBox(width: 10),
              Row(children: [
                InkWell(
                  onTap: () {
                    showDialog<void>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              height: 500,
                              width: 415,
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
                                  SizedBox(height: 20),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.camera_alt_rounded),
                                          SizedBox(width: 5),
                                          Text(
                                            'Documentation',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: NetworkImage(
                                                "${model.gambar1}"),
                                            fit: BoxFit.cover,
                                          )),
                                          width: AppSize.screenWidth * 0.4,
                                          height: AppSize.screenHeight * 0.2,
                                        ),
                                      ]),
                                      SizedBox(width: 15),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                              image: NetworkImage(
                                                  "${model.gambar2}"),
                                              fit: BoxFit.cover,
                                            )),
                                            width: AppSize.screenWidth * 0.4,
                                            height: AppSize.screenHeight * 0.2,
                                          ),
                                        ],
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
                    height: AppSize.screenHeight * 0.035,
                    width: AppSize.screenWidth * 0.12,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.photo_camera, color: Colors.white, size: 11),
                        Text('Photos',
                            style:
                                TextStyle(color: Colors.white, fontSize: 11)),
                      ],
                    )),
                  ),
                ),
              ])
            ]),
          ],
        ),
      ],
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
                height: 600,
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
                                    Icon(Icons.edit,
                                        color: Colors.black, size: 20),
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
                                  'No',
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
                                  'Nama Kegiatan',
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
                                  'Jenis Kegiatan',
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
                                  'Waktu Pelaksanaan',
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
                                  'Tempat Kegiatan',
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
                                  'Jumlah Peserta',
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
                                  'Dokumentasi',
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
              ),
            );
          });
    },
    borderRadius: BorderRadius.circular(20),
    child: Container(
      height: AppSize.screenHeight * 0.035,
      width: AppSize.screenWidth * 0.085,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.edit_document, color: Colors.white, size: 11),
          Text(
            'Edit',
            style: TextStyle(color: Colors.white, fontSize: 11),
          ),
        ],
      )),
    ),
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
      height: AppSize.screenHeight * 0.035,
      width: AppSize.screenWidth * 0.098,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.delete_sweep, color: Colors.white, size: 11),
          Text('Delete', style: TextStyle(color: Colors.white, fontSize: 11)),
        ],
      )),
    ),
  );
}
