import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:standard_project/core/api/api_client.dart';
import 'package:standard_project/module/samplehitapi/data/constant/samplehitapi_constant.dart';
import 'package:standard_project/module/samplehitapi/data/model/wilayah_indonesia_model.dart';
import 'package:dio/dio.dart' as DioPlugin;

class SamplehitapiRepo {
  Future<void> repoFunc() async {
    try {} catch (e) {
      rethrow;
    }
  }

  Future<List<WilayahIndonesiaModel>> fetchWilayahData() async {
    debugPrint("Print Wilayah 1");
    try {
      // DioPlugin.Response response = await ApiClient().postData(
      //   apiModel: SampleHitAPIConstant.urlAPIWilayah,
      // );

      final Dio _dio = Dio();
      final response = await _dio
          .get('https://ibnux.github.io/BMKG-importer/cuaca/wilayah.json');

      debugPrint("Print Wilayah 2 ");

      List<WilayahIndonesiaModel> data =
          wilayahIndonesiaListFromJson(response.data);

      debugPrint("Print Wilayah 4 ${data}");
      return data;
    } catch (e) {
      throw Exception(null);
    }
  }
}
