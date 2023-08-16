import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/module/ac/achievement/controller/achievement_controller.dart';
import 'package:standard_project/module/ac/achievement/data/model/achievement_model.dart';
import 'package:standard_project/core/style/app_color.dart';


class AchievementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetBuilder<AchievementController>(
        init: AchievementController(),
        builder: (AchievementController controller) {
          return Scaffold(
            backgroundColor: Colors.grey.shade400,
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  
                  Container(
                    margin: EdgeInsets.all(20),
                    width: AppSize.screenWidth * 2.7,
                    height: AppSize.screenHeight * 0.93,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),

                    child: Column(
                      children: [
                        //container sa title sa page
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 20, ),
                          child: Row(
                            children: [
                              Text('Prestasi UKM',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1
                                ),),

                                SizedBox(width: 500,),

                                Container(
                                  child: search(), 
                                ),
                                Container(
                                  child: pop1(context, 'title'),
                                ),
                                Container(
                                  child: sort(),
                                )
                            ],
                          ),),

                          Container(
                            margin: EdgeInsets.only(bottom: 10, left: 20),
                            child: Row(
                              children: [
                                Text('Politeknik Piksi Ganesha',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.5)
                                  ),),
                              ],
                            ),
                          ),
// container sang list grid
                          
                          Container(
                            
                            width: AppSize.screenWidth * 3.3,
                            height: AppSize.screenHeight * 0.8,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200
                                      ),
                            child: GridView.builder(
                              itemCount: controller.achievementList.length,
                              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                childAspectRatio: 1.5,
                                  ), 
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    item(controller.achievementList[index], context)
                                  ],
                                );
                              }
                              )
                              ),

                      
// container sang list grid



                      
                      ],
                    ),
                  ),       //main container

                  
                ],
              ),
            ),
          );
        });
  }
}

Widget sort() {
  return Container(
    width: 70,
    height: AppSize.screenHeight * 0.04,
    decoration: BoxDecoration(
      color: AppColors.bilu,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade400,
          blurRadius: 10,
          spreadRadius: 3,
          offset: Offset(5, 5)
        )
      ]
    ),
    child: Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Text('Sort',
            style: TextStyle(
              color: Colors.white
            )),
            SizedBox(width: 10,),
          Icon(
            Icons.sort,
            size: 15,
            color: Colors.white

          ),
        ],
      ),
    ),
  );
}

Widget item(AchievementModel model, context) {
  return Container(
    //height: AppSize.screenHeight * 0.27,
    //width: AppSize.screenWidth * 0.6,
    padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      margin: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10)
    ),
    child: Row(
      children: [
        Column(
          children: [

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(child: Row(
                  children: [

                    Container(
                      child: 
                        Row(
                          children: [
                            prestasipic(),
                            SizedBox(
                              width: 10,
                            ),
                            Text('${model.Keterangan}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),),
                          ],
                        ),
                    ),
                  ],
                )),

                    SizedBox(height: 5,),

                 
                    Container(child: Text('${model.Sumber}',
                        style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey
                        
                      ),)),


                    SizedBox(height: 5,),
                
                  
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.calendar_month,
                              size: 15,),
                            SizedBox(width: 5,),
                            Text('${model.Tanggal}',
                            style: TextStyle(
                                  fontSize: 15
                                ),),
                          ],
                        ),
                      ),
                    
                    SizedBox(height: 5,),
                    
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.lock_clock,
                              size: 15,),
                            SizedBox(width: 5,),
                            Text('${model.Waktu}',
                                              ),
                          ],
                        ),
                      ),
          
                    Divider(
                      endIndent: 0,
                      color: Colors.black,
                      indent: 0,
                      height: 15,
                    ),

            
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [

                    Container(
                      alignment: Alignment.topRight,
                      child: edit(context, 'title'),
                    ),

                    SizedBox(width: 10,),

                    Container(
                      alignment: Alignment.topRight,
                      child: hapus(context, 'title'),
                    ),

                    SizedBox(width: 10,),

                    Container(
                      alignment: Alignment.topRight,
                      child: seemore(context, 'title'),
                    ),
                    

                  ],
                )
              ],
            )
            
                      

          ],
        )
      ],
    )])
    );
  
}




Widget search() {
  return Container(
    width: AppSize.screenWidth * 0.8,
    height: AppSize.screenHeight * 0.04,
    child: TextFormField(
      decoration: InputDecoration(
        labelText: 'Search Prestasi',
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.blue.withOpacity(0.5),
          size: 13,
        ),
      ),
    ),
  );
}


Widget pop1(context, title) {
  return InkWell(
      onTap: () {
      showDialog<void>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                height: 450,
                width: 550,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 525),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(Icons.close)),
                              ],
                            ),
                          ),
                        ],
                      ),
                     
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(15),
                            child: Text(
                              'Form Prestasi UKM',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Keterangan Prestasi',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.description),
                            ),
                          ),
                        ],
                      ),
                      
                      SizedBox(height: 10),
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Tanggal',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.calendar_month),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Waktu',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock_clock),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Sumber Prestasi',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.event),
                            ),
                          ),
                        ],
                      ),
                     
                      SizedBox(height: 10),
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Dokumentasi',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.camera),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: AppSize.screenHeight * 0.04,
                                  width: AppSize.screenWidth * 0.17,
                                  decoration: BoxDecoration(
                                     color: Colors.blue,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Save',
                                    style: TextStyle(
                                        color: Colors.white , fontSize: 11.5),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ],
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
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      height: AppSize.screenHeight * 0.04,
      width: AppSize.screenWidth * 0.12,
      decoration: BoxDecoration(
        boxShadow: [
        BoxShadow(
          color: Colors.grey.shade400,
          blurRadius: 10,
          spreadRadius: 3,
          offset: Offset(5, 5)
        )
      ],
        color: AppColors.bilu,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(Icons.add,
            size: 14,
            color: Colors.white,),
 
          SizedBox(width: 5,),
          
          Text('Add',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15
            ),),
         
        ],
      )
            
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
                width: 350,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 325),
                      child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(Icons.close)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Do you want to delete this Achievement?',
                      style: TextStyle(color: Colors.black, fontSize: 15,
                            fontWeight: FontWeight.w600, letterSpacing: 2
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: AppSize.screenHeight * 0.04,
                            width: AppSize.screenWidth * 0.09,
                            decoration: BoxDecoration(
                              color: AppColors.bilu,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                                child: Text('Yes',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11.5))),
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: AppSize.screenHeight * 0.04,
                            width: AppSize.screenWidth * 0.09,
                            decoration: BoxDecoration(
                              color: AppColors.bilu,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                                child: Text('No',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11.5))),
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
      padding: EdgeInsets.only(left: 5),
      height: AppSize.screenHeight * 0.035,
      width: AppSize.screenWidth * 0.13,
      decoration: BoxDecoration(
       color: AppColors.bilu,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [

          Text('Delete',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white
            ),),

          SizedBox(width: 5,),

          Icon(Icons.delete,
            size: 10,
            color: Colors.white,)

        ],
      )
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
                height: 450,
                width: 550,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 525),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(Icons.close)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              'Form Prestasi UKM',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Keterangan Prestasi',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.description),
                            ),
                          ),
                        ],
                      ),
                     
                      SizedBox(height: 10),
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Tanggal',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.calendar_month),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Waktu',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock_clock),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Sumber Prestasi',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.event),
                              
                            ),
                          ),
                        ],
                      ),
                     
                      SizedBox(height: 10),
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Dokumentasi',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.camera),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: AppSize.screenHeight * 0.04,
                                  width: AppSize.screenWidth * 0.17,
                                  decoration: BoxDecoration(
                                     color: AppColors.bilu,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Save Changes',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11.5),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ],
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
      padding: EdgeInsets.only(left: 5,),
      height: AppSize.screenHeight * 0.035,
      width: AppSize.screenWidth * 0.12,
      decoration: BoxDecoration(
        color: AppColors.bilu,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [

          Text('Edit',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white
            ),
          ),

            SizedBox(width: 5,),

          Icon(Icons.edit,
            size: 10,
            color: Colors.white,
          ),
          
        ],
      ),
      
    ),
  );
}

Widget seemore(context, title) {
  return InkWell(
      onTap: () {
      showDialog<void>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                height: 550,
                width: 750,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 725),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(Icons.close)),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: Column(
                          children: [
                           

                            SizedBox(height: 10,),

                            nct3(),

                            SizedBox(height: 20,),

                                      

                                      Text('Keren, 3 Mahasiswa Politeknik Piksi Ganesha Raih Juara Lomba Menyanyi Solo',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                      ),),

                                      SizedBox(height: 20,),

                                      Text('Mahasiswa IT, Mark Lee berhasil meraih Juara 1 Lomba Nyanyi Solo dalam Arti Fair Unimugo, 06 Agustus 2023.',
                                        style: TextStyle(
                                        fontSize: 15,
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.black
                                      ),
                                      ),

                                      SizedBox(height: 10,),
                             
                                       Text('Selain Mark ada 2 nama mahasiswa Politeknik Piksi Ganesha yang keluar sebagai juara, yaitu Jeno Lee juara Harapan 1 dan Jaemin Na Juara Harapan 3.',
                                        style: TextStyle(
                                        fontSize: 15,
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.black
                                      ),
                                      ),

                                      SizedBox(height: 15,),

                                     
                          ],
                        ),
                      
                      
                      
                    
                  )]))));
                
              
                    
          });},
    
    borderRadius: BorderRadius.circular(20),
    child: Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      height: AppSize.screenHeight * 0.035,
      width: AppSize.screenWidth * 0.18,
      decoration: BoxDecoration(
        color: AppColors.bilu,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Text('See more',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white
            ),),

          SizedBox(width: 5,),

          Icon(Icons.more,
            size: 10,
            color: Colors.white,)
        ],
      )
    ),
  );
}



class one1 extends StatelessWidget {
  const one1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        height: 300,
        width: 200,
        fit: BoxFit.cover,
        image: NetworkImage('https://w0.peakpx.com/wallpaper/272/764/HD-wallpaper-mark-lee-jeno-nct-kpop-nct-127-nct-2020-nct-dream-nct-u-nctzen-resonance-pt2-wayv-workit-thumbnail.jpg')),
    );
  }
}

class nct3 extends StatelessWidget {
  const nct3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
        BoxShadow(
          color: Colors.grey.shade400,
          blurRadius: 10,
          spreadRadius: 3,
          offset: Offset(5, 5)
        )
      ]
      ),
      child: Image(
        height: 350,
        width: 600,
        fit: BoxFit.cover,
image: NetworkImage('https://assets.ayobandung.com/crop/0x0:0x0/750x500/webp/photo/2023/03/10/FotoJet-9-3067570704.jpg'),      )
    );
  }
}


class prestasipic extends StatelessWidget {
  const prestasipic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        height: 30,
        width: 30,
        fit: BoxFit.cover,
        image: NetworkImage('https://cdn-icons-png.flaticon.com/128/1170/1170611.png')),
    );
  }
}


