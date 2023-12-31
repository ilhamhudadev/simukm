import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:standard_project/module/samplehitapi/data/model/wilayah_indonesia_model.dart';

class Reportrepo {
  Future<void> repoFunc() async {
    try {} catch (e) {
      rethrow;
    }
  }

  Future<List<WilayahIndonesiaModel>> fetchWilayahData() async {
    debugPrint("Print Wilayah");
    try {
      final Dio _dio = Dio();
      final response = await _dio
          .get('https://ibnux.github.io/BMKG-importer/cuaca/wilayah.json');

      debugPrint("Print Wilayah");

      List<WilayahIndonesiaModel> data =
          wilayahIndonesiaListFromJson(response.data);

      debugPrint("Print Wilayah 4 ${data}");
      return data;
    } catch (e) {
      throw Exception(null);
    }
  }
}
