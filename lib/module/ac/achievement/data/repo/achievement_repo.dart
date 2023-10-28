import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:standard_project/module/ac/achievement/data/model/achievement_model.dart';

class AchievementRepo {
  Future<void> repoFunc() async {
    try {
      //      servFunc();
    } catch (e) {
      rethrow;
    }
  }
  Future<List<AchievemenModel>> fetchAchievemen() async {
    debugPrint("Print Wilayah");
    try {
      final Dio _dio = Dio();
      final response = await _dio
          .get('https://ibnux.github.io/BMKG-importer/cuaca/wilayah.json');

      debugPrint("Print Wilayah 1 ${response.data}");

      List<AchievemenModel> data = achievemenListFromJson(response.data);

      debugPrint("Print Wilayah 4 ");
      return data;
    } catch (e) {
      throw Exception(null);
    }
  }
}
