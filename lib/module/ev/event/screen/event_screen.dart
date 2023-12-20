import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_color.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/core/variables/app_constant.dart';
//import 'package:standard_project/core/style/app_color.dart';
import 'package:standard_project/module/ev/event/controller/event_controller.dart';
import 'package:standard_project/module/ev/event/data/model/event_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetBuilder<EventController>(
        init: EventController(),
        builder: (EventController controller) {
          controller.getEvent();
          return Scaffold(
              backgroundColor: AppColors.greybegroud,
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 233, 232, 232),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 10, left: 43),
                                  child: const Text('Kegiatan Mahasiswa',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
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
                                              hintText: "Cari Event",
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
                                SizedBox(
                                  width: 10,
                                ),
                                buttonAdd(context, "")
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Obx(() => Container(
                          constraints: const BoxConstraints(minHeight: 0),
                          width: AppSize.screenWidth * 3,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 233, 232, 232),
                          ),
                          child: controller.eventData.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.eventData.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(children: [
                                      Center(
                                          child: item(
                                              controller.eventData[index],
                                              context))
                                    ]);
                                  },
                                )
                              : Container())),
                    ],
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

Widget buttonAdd(context, title) {
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
                              child: const Icon(Icons.close)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                left: 35, right: 35, top: 35, bottom: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.add_link,
                                        color: Colors.black, size: 20),
                                    const SizedBox(width: 5),
                                    const Text(
                                      'Form Create',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const Divider(
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
                        padding: const EdgeInsets.only(
                            left: 40.0, right: 40.0, bottom: 10.0),
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'No',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 13, horizontal: 10),
                                    isDense: true,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Nama Kegiatan',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 13, horizontal: 10),
                                    isDense: true,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Jenis Kegiatan',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                TextFormField(
                                  decoration: const InputDecoration(
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
                            const SizedBox(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Waktu Pelaksanaan',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                TextFormField(
                                  decoration: const InputDecoration(
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
                            const SizedBox(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tempat Kegiatan',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 13, horizontal: 10),
                                    isDense: true,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Jumlah Peserta',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 13, horizontal: 10),
                                    isDense: true,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Dokumentasi',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 13, horizontal: 10),
                                    isDense: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                height: AppSize.screenHeight * 0.04,
                                width: AppSize.screenWidth * 0.1,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent.shade700,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: const Center(
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
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.only(right: 15, left: 10, bottom: 15, top: 15),
      decoration: BoxDecoration(
        color: AppColors.bilu,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.add, color: Colors.white, size: 13),
          const Text(
            'Create',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      )),
    ),
  );
}

Widget item(DataEvent model, context) {
  return Container(
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${model.eventName}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  Text("${model.eventDate}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      )),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.class_sharp, color: Colors.black, size: 20),
                  const SizedBox(width: 5),
                  Container(
                      width: 200,
                      child: Text("${model.eventDescription}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20))),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.black, size: 20),
                  const SizedBox(width: 5),
                  Container(
                      width: 200,
                      child: Text("${model.eventDate}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20))),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: edit(context, 'title'),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    alignment: Alignment.topRight,
                    child: hapus(context, 'title'),
                  ),
                  const SizedBox(width: 10),
                  Row(children: [
                    photos(context, model, model.eventAttachment),
                  ])
                ]),
          ],
        ),
      ],
    ),
  );
}

Widget photos(BuildContext context, model, url) {
  return InkWell(
    onTap: () {
      openUrl(
        url,
      );
    },
    child: Container(
      padding:
          const EdgeInsets.only(bottom: 9.5, top: 9.5, left: 12, right: 12),
      decoration: BoxDecoration(
        color: Colors.blueAccent.shade700,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.photo_camera, color: Colors.white, size: 15),
          const Text('Photos',
              style: TextStyle(color: Colors.white, fontSize: 15)),
        ],
      )),
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
                              child: const Icon(Icons.close)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                left: 35, right: 35, top: 35, bottom: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.edit,
                                        color: Colors.black, size: 20),
                                    const SizedBox(width: 5),
                                    const Text(
                                      'Event',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const Divider(
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
                        padding: const EdgeInsets.only(
                            left: 40.0, right: 40.0, bottom: 10.0),
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'No',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                TextFormField(
                                  decoration: const InputDecoration(
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
                            const SizedBox(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Nama Kegiatan',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                TextFormField(
                                  decoration: const InputDecoration(
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
                            const SizedBox(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Jenis Kegiatan',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                TextFormField(
                                  decoration: const InputDecoration(
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
                            const SizedBox(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Waktu Pelaksanaan',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                TextFormField(
                                  decoration: const InputDecoration(
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
                            const SizedBox(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tempat Kegiatan',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                TextFormField(
                                  decoration: const InputDecoration(
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
                            const SizedBox(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Jumlah Peserta',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                TextFormField(
                                  decoration: const InputDecoration(
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
                            const SizedBox(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Dokumentasi',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                TextFormField(
                                  decoration: const InputDecoration(
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
                      const SizedBox(width: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                height: AppSize.screenHeight * 0.04,
                                width: AppSize.screenWidth * 0.15,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent.shade700,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: const Center(
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
    child: Container(
      padding:
          const EdgeInsets.only(bottom: 9.5, top: 9.5, left: 12, right: 12),
      decoration: BoxDecoration(
        color: Colors.blueAccent.shade700,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.edit_document, color: Colors.white, size: 15),
          const Text(
            'Edit',
            style: TextStyle(color: Colors.white, fontSize: 15),
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
          barrierDismissible: true,
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
                        child: const Icon(Icons.close)),
                    const SizedBox(height: 10),
                    const Text(
                      'Apakah yakin hapus data?',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: AppSize.screenHeight * 0.04,
                            width: AppSize.screenWidth * 0.06,
                            padding: const EdgeInsets.only(left: 4.5),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.shade700,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Row(
                              children: [
                                const Center(
                                    child: Text('Yes',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11.5))),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: AppSize.screenHeight * 0.04,
                            width: AppSize.screenWidth * 0.06,
                            padding: const EdgeInsets.only(left: 2.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueAccent.shade700,
                                  spreadRadius: 1,
                                )
                              ],
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Center(
                                child: Text('No',
                                    style: TextStyle(
                                        color: Colors.blueAccent.shade700,
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
          const EdgeInsets.only(bottom: 9.5, top: 9.5, left: 12, right: 12),
      decoration: BoxDecoration(
        color: Colors.blueAccent.shade700,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.delete_sweep, color: Colors.white, size: 15),
          const Text('Delete',
              style: TextStyle(color: Colors.white, fontSize: 15)),
        ],
      )),
    ),
  );
}
