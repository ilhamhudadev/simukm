import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_color.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/module/samplehitapi/controller/samplehitapi_controller.dart';
import 'package:standard_project/module/samplehitapi/data/model/wilayah_indonesia_model.dart';

class SamplehitapiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetBuilder<SamplehitapiController>(
      init: SamplehitapiController(),
      builder: (SamplehitapiController controller) {
        return Scaffold(
          body: FutureBuilder<List<WilayahIndonesiaModel>>(
              future: controller.futureWilayahData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var value = snapshot.data;
                  return Container(
                      padding: const EdgeInsets.all(20),
                      height: AppSize.screenHeight,
                      width: AppSize.screenWidth,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          controller: controller.scrollController,
                          shrinkWrap: true,
                          itemCount: value!.length,
                          itemBuilder: ((context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: AppColors.placeholdertextfield)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Kecamatan : ${value[index].kecamatan}"),
                                    Text("Kota : ${value[index].kota}"),
                                    Text("Latitude : ${value[index].lat}"),
                                    Text("Longitude : ${value[index].lon}"),
                                  ]),
                            );
                          })));
                } else {
                  return const Center(
                    child: Text("GAK ADA DATA BROWW"),
                  );
                }
              }),
        );
      },
    );
  }
}
