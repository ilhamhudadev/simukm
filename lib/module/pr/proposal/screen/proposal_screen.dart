
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:standard_project/core/style/app_size.dart';
  import 'package:standard_project/module/pr/proposal/controller/proposal_controller.dart';
  import 'package:standard_project/module/pr/proposal/data/model/user_management.dart';
  import 'package:standard_project/core/style/app_color.dart';


  class ProposalScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      AppSize().init(context);
      return GetBuilder<ProposalController>(
        init: ProposalController(),
        builder: (ProposalController controller) {
          return Scaffold(
            backgroundColor: Colors.grey.shade400,
            body: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                        children: [

 // containers  - main container               
                  
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
                              Text('Proposal UKM',
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
                              itemCount: controller.proposalList.length,
                              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                childAspectRatio: 1.5,
                                  ), 
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    item(controller.proposalList[index], context)
                                  ],
                                );
                              }
                              )
                              ),

                      
// container sang list grid



                      
                      ],
                    ),
                  ),       //main container
                    
                    

              
                 
                        



                     
                                
                        ], //children
          ) //Column
          ) //SinglechildScrollView
          );  //Scaffold
          
      }
      ); //GetBuilder
       
           } //
        
  
  
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

Widget search() {
  return Container(
    width: AppSize.screenWidth * 0.8,
    height: AppSize.screenHeight * 0.04,
    decoration: BoxDecoration(
      
    ),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: 'Search Proposal',
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
                height: 550,
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
                              'Form Proposal UKM',
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
                              labelText: 'Judul Proposal',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Deskripsi Proposal',
                              border: OutlineInputBorder(),
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
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Tempat Pelaksanaan',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Anggaran',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Dokumen Proposal',
                              border: OutlineInputBorder(),
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
                                        color: AppColors.bilu, fontSize: 11.5),
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
        color: AppColors.bilu,
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
      child: Row(
        children: [
          
          Text('Add',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15
            ),),

            SizedBox(width: 5,),

            Icon(Icons.add,
            size: 14,
            color: Colors.white,),
 
          
         
        ],
      )
            
    ),
  );
}


Widget item(proposal1 model, context) {
  return Container(
    //height: AppSize.screenHeight * 0.27,
    //width: AppSize.screenWidth * 0.6,
    padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      margin: EdgeInsets.all(10),
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

                    Text('${model.Judul}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                  ],
                )),

                    SizedBox(height: 5,),

                 
                    Container(child: Text('${model.Deskripsi}',
                        style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey
                        
                      ),)),

                    SizedBox(height: 7,),

            
                    Container(child: Row(
                      children: [
                        Icon(Icons.location_pin,
                          size: 15,
                          color: Colors.blue,
                          ),
                        SizedBox(width: 5,),
                        Text('${model.Tempat}',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                          ),),
                      ],
                    )),

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
                      'Do you want to delete this Proposal?',
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
        boxShadow: [
        BoxShadow(
          color: Colors.grey.shade400,
          blurRadius: 10,
          spreadRadius: 1,
          offset: Offset(5, 5)
        )
      ]
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
                height: 550,
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
                              'Form Proposal UKM',
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
                              labelText: 'Judul Proposal',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Deskripsi Proposal',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Tanggal Proposal',
                              border: OutlineInputBorder(),
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
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Tempat Pelaksanaan',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Anggaran',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Dokumen',
                              border: OutlineInputBorder(),
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
        boxShadow: [
        BoxShadow(
          color: Colors.grey.shade400,
          blurRadius: 10,
          spreadRadius: 1,
          offset: Offset(5, 5)
        )
      ]
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
                            Container(
                              child: Text('“Peningkatan Infrastruktur dan Pengolahan Energi Baru Terbarukan untuk Ketahanan Energi Nasional”',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 3
                                ),
                              ),
                            ),

                            SizedBox(height: 20,),

                            pic1_tweety(),


                                                  SizedBox(height: 20,),
                                      Text('Deskripsi Kegiatan:',
                                              style: TextStyle(
                                                fontSize: 12
                                              ),
                                        ),
                                      
                                      SizedBox(height: 20,),

                                      Text('Sesuai dengan Peraturan Pemerintah Nomor 79 Tahun 2014 tentang Kebijakan Energi Nasional, Ketahanan Energi adalah suatu kondisi terjaminnya ketersediaan energi dan akses masyarakat terhadap energi pada harga yang terjangkau dalam jangka panjang dengan tetap memperhatikan perlindungan terhadap lingkungan hidup.',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                      ),),

                                      SizedBox(height: 10,),

                                      Text('Maksud diadakannya kegiatan Seminar Nasional ini adalah untuk memberikan pengetahuan dan kesiapan mental bagi mahasiswa teknik setelah lulus kuliah serta menjadi pelopor inovasi dalam pengembangan energi terbarukan.',
                                        style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                      ),
                                      ),

                                      SizedBox(height: 20,),
                             

                                 Row(
                                   children: [
                                     Text('Kegiatan ini akan dilaksanakan pada:',
                                                          style: TextStyle(
                                                            fontSize: 12
                                                          ),
                                                        ),
                                   ],
                                 ),
                                Text('Hari/Tanggal : Sabtu, 3 November 2018',
                                              style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black
                                      ),),

                                      SizedBox(height: 20,),

                                Text('Waktu : 09.00 WIB s/d 13.00 WIB',
                                              style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black
                                      ),),

                                      SizedBox(height: 20,),

                                 Text('Tempat : Auditorium Fakultas Teknik Lt. 5',
                                                style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black
                                              ),),
                                      
                                      SizedBox(height: 20,),

                                Text('Anggaran yang dibutuhkan : Rp. 2.500.000',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black
                                              ),),
                                

                               
                                
                            
                                 SizedBox(height: 20,),

                                                              
                                
                                Container(child: Row(
                                  children: [
                                    Text('Dokumen : ',
                                      style: TextStyle(
                                        fontSize: 12
                                      ),
                                    ),

                                    SizedBox(height: 10,),

                                    TextButton(onPressed: () {}, child: Text('Ketahanan_Energi_Nasional.pdf',
                                        style: TextStyle(color: Colors.blue, fontSize: 15)))
                                  ],
                                )),
                                

                                SizedBox(height: 10,),


      

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
        boxShadow: [
        BoxShadow(
          color: Colors.grey.shade400,
          blurRadius: 10,
          spreadRadius: 1,
          offset: Offset(5, 5)
        )
      ]
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

class pic1_tweety extends StatelessWidget {
  const pic1_tweety({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        height: 200,
        width: 200,
        fit: BoxFit.cover,
        image: NetworkImage('https://www.tvstoreonline.com/cdn/shop/articles/tweet-this-21-facts-you-never-knew-about-looney-tune-s-tweety-bird-tvstoreonline.jpg?v=1661283786')),
    );
  }
}

class pic2 extends StatelessWidget {
  const pic2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        height: 500,
        width: 500,
        fit: BoxFit.fill,
        image: NetworkImage('https://pemulihanhijau.id/wp-content/uploads/2022/07/Pemerintah-perlu-memperbaiki-iklim-investasi-energi-terbarukan.jpg')),
    );
  }
}


