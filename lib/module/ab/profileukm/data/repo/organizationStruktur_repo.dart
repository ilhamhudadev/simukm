import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:standard_project/module/ab/profileukm/data/model/organizationStruktur_model.dart';

class OraganizationStrukturRepo {
  Future<void> repoFunc() async {
    try {} catch (e) {
      rethrow;
    }
  }

  Future<List<WilayahModel>> fetchWilayah() async {
    debugPrint("Print Wilayah");
    try {
      final Dio _dio = Dio();
      final response = await _dio
          .get('https://ibnux.github.io/BMKG-importer/cuaca/wilayah.json');

      debugPrint("Print Wilayah 1 ${response.data}");

      List<WilayahModel> data = wilayahListFromJson(response.data);

      debugPrint("Print Wilayah 4 ");
      return data;
    } catch (e) {
      throw Exception(null);
    }
  }
}
