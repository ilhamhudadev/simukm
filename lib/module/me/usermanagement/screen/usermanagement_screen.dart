import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/core/style/app_color.dart';
import 'package:standard_project/module/me/usermanagement/controller/usermanagement_controller.dart';
import 'package:standard_project/module/me/usermanagement/data/model/user_menejemen.dart';

class UsermanagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext contextUser) {
    AppSize().init(contextUser);
    return GetBuilder<UsermanagementController>(
      init: UsermanagementController(),
      builder: (UsermanagementController controller) {
        return Scaffold(
          backgroundColor: Color(0x6BDEDDDD),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        width: AppSize.screenWidth * 2,
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 5.0),
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide())),
                        ),
                      ),
                      buttonAdd()
                    ],
                  ),
                  Container(
                    height: 100,
                    width: AppSize.screenWidth * 3,
                    decoration: BoxDecoration(color: Color(0xFFDADADA)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: 10, left: 20, right: 20),
                              child: Text(
                                'Developer Management',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 25),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 30,
                                  width: 350,
                                  margin: EdgeInsets.only(left: 30, top: 25),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Search',
                                    ),
                                  ),
                                ),
                                buttonAdd(),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                      constraints: BoxConstraints(minHeight: 0),
                      width: AppSize.screenWidth * 3,
                      decoration: BoxDecoration(color: Color(0xFFDADADA)),
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: controller.usermenejemenList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                              child: item(controller.usermenejemenList[index],
                                  context));
                        },
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  InkWell buttonDelete() {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: 5, top: 10),
        padding: EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
        decoration: BoxDecoration(
          color: AppColors.bilu,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(children: [
          Icon(
            Icons.delete,
            size: 12,
            color: Colors.white,
          ),
          Text(
            'Delete',
            style: TextStyle(fontSize: 12, color: Colors.white),
          )
        ]),
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
                  width: 520,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Full name'),
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
                                  hintText: 'First name',
                                  labelText: 'First name'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
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
                                  hintText: 'Second name',
                                  labelText: 'Second name'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email address'),
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
                                    borderSide: BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Email address',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 250,
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
                                  hintText: 'Username',
                                  labelText: 'Username'),
                            ),
                          ),
                          Container(
                            width: 250,
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
                                  hintText: 'Password',
                                  labelText: 'Password'),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sosial media'),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 250,
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
                                      hintText: 'Instagram',
                                      labelText: 'Instagram'),
                                ),
                              ),
                              Container(
                                width: 250,
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
                                      hintText: 'Youtube',
                                      labelText: 'Youtube'),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 250,
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
                                  hintText: 'Twitter',
                                  labelText: 'Twitter'),
                            ),
                          ),
                          Container(
                            width: 250,
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
                                  hintText: 'phone',
                                  labelText: 'Phone'),
                            ),
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
        margin: EdgeInsets.only(left: 5, top: 10),
        padding: EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
        decoration: BoxDecoration(
          color: AppColors.bilu,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(children: [
          Icon(
            Icons.edit,
            size: 12,
            color: Colors.white,
          ),
          Text(
            'Edit',
            style: TextStyle(color: Colors.white, fontSize: 12),
          )
        ]),
      ),
    );
  }

  Widget buttonAdd() {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 10),
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
              'Add',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget item(usermajemenModel model, context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage("${model.urlAvatar}"),
                                    fit: BoxFit.contain),
                                borderRadius: BorderRadius.circular(0)),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${model.name}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${model.email}",
                                  style: TextStyle(color: Color(0xFF6C6B6B)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model.nickname}',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 15,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Username',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        '${model.username}',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'Number phone',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Text('${model.phone}'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sosial Media',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/instagram.png'))),
                        ),
                        Text(
                          '${model.instagram}',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/youtube.png'))),
                        ),
                        Text(
                          '${model.youtube}',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/twitter.png'))),
                        ),
                        Text(
                          '${model.twitter}',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        buttonEdit(context),
                        buttonDelete(),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  InkWell seemore(context) {
    return InkWell(
      onTap: () {
        showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Container(
                  height: 300,
                  width: 500,
                  child: Column(
                    children: [TextField()],
                  ),
                ),
              );
            });
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, top: 10),
        padding: EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [AppColors.bluese, AppColors.piksi]),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(children: [
          Text(
            'See More',
            style: TextStyle(color: Colors.white, fontSize: 10),
          )
        ]),
      ),
    );
  }
}
