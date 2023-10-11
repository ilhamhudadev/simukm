import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:standard_project/module/ab/profileukm/data/model/decree_model.dart';

class DecreeRepo {
  Future<void> repoFunc() async {
    try {} catch (e) {
      rethrow;
    }
  }

  Future<List<DecreeModel>> fetchDecree() async {
    debugPrint("Print Sampel");
    try {
      final Dio _dio = Dio();
      final response = await _dio
          .get('https://ibnux.github.io/BMKG-importer/cuaca/wilayah.json');

      debugPrint("Print Wilayah 1 ${response.data}");

      List<DecreeModel> data = DecreeListFromJson(response.data);

      debugPrint("Print Wilayah 4 ");
      return data;
    } catch (e) {
      throw Exception(null);
    }
  }
}
