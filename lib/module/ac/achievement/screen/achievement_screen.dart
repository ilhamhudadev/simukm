import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/module/ac/achievement/controller/achievement_controller.dart';
import 'package:standard_project/module/ac/achievement/data/model/achievement_model.dart';

class AchievementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetBuilder<AchievementController>(
        init: AchievementController(),
        builder: (AchievementController controller) {
          return Scaffold(
            backgroundColor: Colors.grey.shade200,
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    padding: EdgeInsets.only(
                        top: 15, bottom: 10, right: 15, left: 15),
                    decoration: BoxDecoration(
                        //color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.card_giftcard),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Prestasi UKM',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 3,
                                    wordSpacing: 2),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 500),
                                padding: EdgeInsets.only(left: 80, right: 20),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    child: search(),
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 20),
                                  child: SingleChildScrollView(
                                    child: Container(
                                      child: inkwell1(),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(left: 15, right: 15),
                      width: AppSize.screenWidth * 6,
                      height: AppSize.screenHeight * 0.73,
                      child: GridView.builder(
                        itemCount: controller.prestasiList.length,
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 1.5,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return item(controller.prestasiList[index], context);
                        },
                      )),
                ],
              ),
            ),
          );
        });
  }
}

class inkwell1 extends StatelessWidget {
  const inkwell1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: SizedBox(
                  height: AppSize.screenHeight * 0.68,
                  width: 500,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            CloseButton(
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Keterangan',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.description,
                                color: Colors.black.withOpacity(0.5),
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                              decoration: InputDecoration(
                            labelText: 'Tanggal',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.calendar_month,
                              color: Colors.black.withOpacity(0.5),
                              size: 15,
                            ),
                          )),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                              decoration: InputDecoration(
                            labelText: 'Waktu',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.lock_clock,
                              color: Colors.black.withOpacity(0.5),
                              size: 15,
                            ),
                          )),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Sumber',
                                prefixIcon: Icon(
                                  Icons.money,
                                  color: Colors.black.withOpacity(0.5),
                                  size: 15,
                                )),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Dokumentasi',
                                prefixIcon: Icon(
                                  Icons.camera,
                                  color: Colors.black.withOpacity(0.5),
                                  size: 15,
                                )),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          margin: EdgeInsets.all(10.0),
                          child: SizedBox(
                            child: InkWell(
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
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 400),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: AppSize.screenWidth * 0.12,
                                              height:
                                                  AppSize.screenHeight * 0.035,
                                              child: Text('SUBMIT')),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      },
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue.shade300,
        ),
        child: SizedBox(
            width: AppSize.screenWidth * 0.05,
            height: AppSize.screenHeight * 0.035,
            child: Text('add')),
      ),
    );
  }
}

Widget search() {
  return Container(
    width: AppSize.screenWidth * 0.8,
    height: AppSize.screenHeight * 0.05,
    child: TextFormField(
      decoration: InputDecoration(
        labelText: 'Search Prestasi',
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black.withOpacity(0.5),
          size: 13,
        ),
      ),
    ),
  );
}

Widget item(prestasiModel model, context) {
  return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(7)),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                '${model.Keterangan}',
              ),
              Text(
                '${model.Tanggal}',
              ),
              Text(
                '${model.Waktu}',
              ),
              Text(
                '${model.Sumber}',
              ),
              Text(
                '${model.Dokumentasi}',
              ),
            ],
          )
        ],
      ));
}
