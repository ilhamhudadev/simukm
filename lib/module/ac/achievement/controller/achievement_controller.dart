import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/globalcontroller/app_function.dart';
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
    var searchText = userId;
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

  // Text Editor Controllers
  TextEditingController userIdTextController = TextEditingController();
  TextEditingController achievementDateTextController = TextEditingController();
  TextEditingController achievementTitleTextController =
      TextEditingController();
  TextEditingController achievementDetailsTextController =
      TextEditingController();
  TextEditingController achievementLocationTextController =
      TextEditingController();
  TextEditingController documentationTextController = TextEditingController();

  Future<void> insertAchievementData() async {
    var data = {
      "user_id": userIdTextController.text,
      "achievement_date": achievementDateTextController.text,
      "achievement_title": achievementTitleTextController.text,
      "achievement_details": achievementDetailsTextController.text,
      "achievement_location": achievementLocationTextController.text,
      "documentation": documentationTextController.text,
    };
    try {
      final Dio _dio = Dio();
      final response = await _dio.post(
        'http://localhost:3000/api/achievement/new',
        data: data,
      );

      Get.back();
      getAchievementLetter();
    } catch (e) {
      throw Exception(null);
    }
  }

  Future<void> updateAchievementData(id) async {
    var data = {
      "id": id,
      "user_id": userIdTextController.text,
      "achievement_date": achievementDateTextController.text,
      "achievement_title": achievementTitleTextController.text,
      "achievement_details": achievementDetailsTextController.text,
      "achievement_location": achievementLocationTextController.text,
      "documentation": documentationTextController.text,
    };
    try {
      final Dio _dio = Dio();
      final response = await _dio.post(
        'http://localhost:3000/api/achievement/update',
        data: data,
      );

      Get.back();
      getAchievementLetter();
    } catch (e) {
      throw Exception(null);
    }
  }

  Future<void> deleteAchievementData(id) async {
    var data = {"id": "$id"};
    try {
      final Dio _dio = Dio();
      final response = await _dio.post(
        'http://localhost:3000/api/achievement/delete',
        data: data,
      );
      Get.back();
      getAchievementLetter();
    } catch (e) {
      throw Exception(null);
    }
  }
}
