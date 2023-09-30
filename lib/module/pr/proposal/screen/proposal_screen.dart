
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
                    //padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Proposal UKM',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),),
                          Container(
                            child: pop1(context, 'title'),
                          ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30, top: 20, bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5), bottomLeft: Radius.circular(5))
                        ),
                        width: 1220,
                        height: 40,
                        
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Search Proposal'
                            
                          )
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.bilu,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          )
                        ),
                        height: 37,
                        child: TextButton.icon(onPressed: (){}, 
                                  icon: Icon(Icons.search, size: 15, color: Colors.white,), 
                                  label: Text('Search', style: TextStyle(
                                    color: Colors.white, fontSize: 15
                                  ),),),
                      ),

                    ],
                  ),

                  SizedBox(height: 20,),

                  Container(

                    width: AppSize.screenWidth * 3.3,
                    height: AppSize.screenHeight * 0.8,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 1.5), 
                        itemCount: controller.proposalList.length,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              item(controller.proposalList[index], context)
                            ],
                          );
                        }))    //main container
                         
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
                              prefixIcon: Icon(Icons.source)
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
                              prefixIcon: Icon(Icons.description)
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
                              prefixIcon: Icon(Icons.calendar_month)
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
                              prefixIcon: Icon(Icons.lock_clock)
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
                              prefixIcon: Icon(Icons.location_city)
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
                              prefixIcon: Icon(Icons.money)
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
                              prefixIcon: Icon(Icons.document_scanner)
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
  return Stack(
    children: [
      Container(
        //height: AppSize.screenHeight * 0.27,
        //width: AppSize.screenWidth * 0.6,
       padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          margin: EdgeInsets.only(bottom: 10, right: 15, left: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [

            Container(child: Row(
              children: [
                        Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage('https://cdn-icons-png.flaticon.com/128/9693/9693609.png')),

                          SizedBox(width: 10,),

                        Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${model.Judul}', style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),),
                            Text('${model.Deskripsi}',
                            style: TextStyle(
                            fontSize: 12,
                          ),),
                ],
              ),
            ),
              ],
            ),
              ),

            SizedBox(height: 15,),

            Container(child: Row(
              children: [
                Icon(Icons.location_pin,
                                  size: 15,),
                                SizedBox(width: 5,),
                                Text('${model.Tempat}',
                                style: TextStyle(
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
                                Icon(Icons.money,
                                  size: 15,),
                                SizedBox(width: 5,),
                                Text('${model.Anggaran}',
                                   style: TextStyle(
                                      fontSize: 13
                                    ),),
                              ],
                            ),
                          ),

                Divider(
                          endIndent: 0,
                          color: Colors.black,
                          indent: 0,
                          height: 15,
                        ),

              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      
                      Container(child: edit(context, 'title')),
                      SizedBox(width: 10,),
                      Container(child: hapus(context, 'title')),
                      SizedBox(width: 10,),
                      Container(child: seemore(context, 'title')),            

                    ],
                  ),
                ],
              )),
              
          ],
        ),
            
  )
  ],
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
                              prefixIcon: Icon(Icons.source)
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
                              prefixIcon: Icon(Icons.description)
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
                              prefixIcon: Icon(Icons.calendar_month)
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
                              prefixIcon: Icon(Icons.lock_clock)
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
                              prefixIcon: Icon(Icons.location_city)
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
                              prefixIcon: Icon(Icons.money)
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
                              prefixIcon: Icon(Icons.document_scanner)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    
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

                                      Row(
                                        children: [
                                          Text('Deskripsi Kegiatan:',
                                                  style: TextStyle(
                                                    fontSize: 12
                                                  ),
                                            ),
                                        ],
                                      ),
                                      
                                      SizedBox(height: 20,),

                                      Text('Sesuai dengan Peraturan Pemerintah Nomor 79 Tahun 2014 tentang Kebijakan Energi Nasional, Ketahanan Energi adalah suatu kondisi terjaminnya ketersediaan energi dan akses masyarakat terhadap energi pada harga yang terjangkau dalam jangka panjang dengan tetap memperhatikan perlindungan terhadap lingkungan hidup.',
                                      style: TextStyle(
                                        fontSize: 15,
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.black
                                      ),),

                                      SizedBox(height: 10,),

                                      Text('Maksud diadakannya kegiatan Seminar Nasional ini adalah untuk memberikan pengetahuan dan kesiapan mental bagi mahasiswa teknik setelah lulus kuliah serta menjadi pelopor inovasi dalam pengembangan energi terbarukan.',
                                        style: TextStyle(
                                        fontSize: 15,
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.black
                                      ),
                                      ),

                                     
                            
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
        height: 300,
        width: 500,
        fit: BoxFit.cover,
        image: NetworkImage('data:image/png;base64,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')),
    );
  }
}
