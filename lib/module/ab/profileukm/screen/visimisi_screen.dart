import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_color.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/module/ab/profileukm/controller/VisiMisi_controller.dart';

class VisiMisiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetBuilder<VisiMisiController>(
        init: VisiMisiController(),
        builder: (VisiMisiController controller) {
          return Scaffold(
            backgroundColor: Color(0xDDEAEAEA),
            body: SingleChildScrollView(
                child: Center(
              child: Column(
                children: [
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
                                'Developer Management',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 30),
                              ),
                            ),
                            buttonAdd()
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
                                  bottom: 5, left: 20, right: 20),
                              child: Row(
                                children: [
                                  Container(
                                    width: AppSize.screenWidth * 2.25,
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
                                  buttonsearch(),
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
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Center(child: item(context));
                        },
                      )),
                ],
              ),
            )),
          );
        });
  }

  Widget buttonAdd() {
    return InkWell(
      onTap: () {},
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

  Widget item(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '20/21',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Visi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                child: Text(
                  '"Terwujudnya BEM FH UI yang bersinergi serta senantiasa hadir sebagai ruang kolaborasi anggota IKM FH UI dalam melaksanakan fungsi pergerakan dan pelayanan demi memberikan kebermanfaatan bagi FH UI, UI, dan Indonesia."',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Misi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      'Menyikap, mengawal, dan mengadvokasikan isu-isu sosial politik secara strategis dan inklusif dengan melibatkan anggota IKM FH UI dalam rangka melakukan pengabdian kepada masyarakat.',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Memenuhi kebutuhan akademik dan keprofesian serta melakukan pengawalan dan advokasi hak-hak anggota IKM FH UI secara aktif dan aspiratif untuk meningkatkan kualitas dan kesejahteraan anggota IKM FH UI.',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Mengakomodasi, mengembangkan, dan mengapresiasi minat dan bakat anggota IKM FH UI dalam bidang olahraga, seni dan budaya, keilmuan, pelayanan keagamaan, dan peminatan bakat lainnya di lingkup FH UI.',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Mengoptimalkan kinerja BEM FH UI dengan meningkatkan kualitas fungsionaris BEM FH UI dan membangun tata kerja internal organisasi yang sistematis, inklusif, dan apresiatif bagi seluruh fungsionaris BEM FH UI.',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}