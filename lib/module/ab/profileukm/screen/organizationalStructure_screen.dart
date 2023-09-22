import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_color.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/module/ab/profileukm/controller/organizationalStructure_controller.dart';

class OrganizationalStruktureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetBuilder<OrganizationStrukturController>(
        init: OrganizationStrukturController(),
        builder: (OrganizationStrukturController controller) {
          return Scaffold(
            backgroundColor: Color(0x6BDEDDDD),
            body: SingleChildScrollView(
              child: Center(
                child: Column(children: [
                  Container(
                    height: 150,
                    width: AppSize.screenWidth * 3,
                    decoration: BoxDecoration(color: Color(0xFFDADADA)),
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
                                'Organizational struktur',
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
                                        blurRadius: 5.0,
                                        offset: Offset(0, 1))
                                  ]),
                              margin: EdgeInsets.only(
                                  bottom: 5, left: 20, right: 20),
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
                                                  bottomLeft:
                                                      Radius.circular(5)),
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
                      decoration: BoxDecoration(color: Color(0xFFDADADA)),
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: 20,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 0.9,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Center(child: item(context));
                        },
                      )),
                ]),
              ),
            ),
          );
        });
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
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pengurus Hamisi',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(Icons.calendar_month),
              SizedBox(
                width: 5,
              ),
              Text(
                '2020/2021',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Supervisor',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'putri',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Chairman',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'Rifqi',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Vice chairman',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'sabyan',
                  style: TextStyle(color: Colors.grey),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      seemore(context),
                      SizedBox(
                        width: 10,
                      ),
                      buttonEdit(context),
                      SizedBox(
                        width: 10,
                      ),
                      buttondelete(context)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
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
                  height: 700,
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

  Widget buttonEdit(context) {
    return InkWell(
      onTap: () {
        showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Container(
                  height: 800,
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
        padding: EdgeInsets.only(bottom: 9.5, top: 9.5, left: 12, right: 12),
        decoration: BoxDecoration(
          color: AppColors.bilu,
          borderRadius: BorderRadius.circular(2),
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

  Widget buttondelete(context) {
    return MaterialButton(
      minWidth: 30,
      height: 42,
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
                    color: Colors.grey[200],
                    child: Text('Yes'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Get.back();
                    },
                    color: Colors.grey[200],
                    child: Text('No'),
                  )
                ],
              );
            });
      },
      child: Row(children: [
        Icon(
          Icons.delete,
          size: 13,
          color: Colors.white,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'Delete',
          style: TextStyle(fontSize: 13, color: Colors.white),
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
                  height: 800,
                  width: 700,
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
                                Text('DOSEN PEMBIMBING'),
                                Container(
                                  height: 1,
                                  width: 100,
                                  color: Colors.black,
                                ),
                                Text('Suparjan. Spd. S.Kom'),
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
                                    Text('KETUA'),
                                    Container(
                                      height: 1,
                                      width: 100,
                                      color: Colors.black,
                                    ),
                                    Text('Reyhan Sabian'),
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
                                    Text('WAKIL KETUA'),
                                    Container(
                                      height: 1,
                                      width: 100,
                                      color: Colors.black,
                                    ),
                                    Text('Rifqi nur'),
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
                                Text(
                                  'SEKERTARIS',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('Saniati'),
                                Text('M. Taufik Munawar'),
                                Text(
                                  'BENDAHARA',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('Diva Rachman'),
                                Text('Salma Siti F'),
                                Text(
                                  'HUSMAS',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('Anggia Putri'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
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
          borderRadius: BorderRadius.circular(2),
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
