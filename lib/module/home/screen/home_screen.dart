import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/module/home/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (HomeController controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: Container(
              child: Row(
                children: [
                  Icon(Icons.ac_unit_outlined),
                  Text(
                    "MENU BAR",
                  )
                ],
              ),
            ),
          ),
          body: Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Pop Up")),
                SizedBox(
                  height: 50,
                ),
                sectionTitle(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    sectionTitle(),
                    sectionSignUp(
                        MainAxisAlignment.start, CrossAxisAlignment.start),
                  ],
                ),
                sectionSignUp(
                    MainAxisAlignment.center, CrossAxisAlignment.center),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget sectionTitle() {
    return Container(
        width: 300,
        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.only(left: 130),
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(100)),
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red)))),
                    onPressed: () {},
                    child: Text(
                      "Sign in",
                      textAlign: TextAlign.center,
                    ))),
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(100)),
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)))),
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    textAlign: TextAlign.center,
                  )),
            )
          ],
        ));
  }
}

Widget sectionSignUp(main, cross) {
  return Row(
    mainAxisAlignment: main,
    crossAxisAlignment: cross,
    children: [
      Text(
        "Belum Punya Akun? ",
        style: TextStyle(color: Colors.black54),
      ),
      // SizedBox(
      //   width: 3,
      // ),
      InkWell(
        onTap: () {},
        child: Text(
          " Daftar Sekarang",
          style: TextStyle(color: Colors.blue),
        ),
      )
    ],
  );
}
