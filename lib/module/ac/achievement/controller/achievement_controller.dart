import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/variables/app_constant.dart';
import 'package:standard_project/module/ac/achievement/data/model/achievement_model.dart';
import 'package:standard_project/module/ac/achievement/data/repo/achievement_repo.dart';
import 'package:standard_project/module/ac/achievement/data/model/achievement_management.dart';
import 'package:dio/dio.dart' as DioPlugin;
import 'package:dio/dio.dart';

class AchievementController extends GetxController with AchievementRepo {
  RxList<DataAchievement> achievementData = <DataAchievement>[].obs;
  ScrollController scrollController = ScrollController();

  // Variabel Search
  TextEditingController searchController = TextEditingController();

  Future<void> getAchievementLetter() async {
    var searchText = searchController.value.text;
    try {
      final Dio _dio = Dio();
      final response =
          await _dio.get('http://localhost:3000/api/achievement/${searchText}');

      AchievementModel value = AchievementModel.fromJson(response.data);

      if (value.data!.isNotEmpty) {
        achievementData.value = value.data!;
      } else {
        AppConstant().setSnackbar("UKM Tidak Ditemukan");
      }
    } catch (e) {
      throw Exception(null);
    }
  }
}
