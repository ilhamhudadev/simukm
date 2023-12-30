import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/globalcontroller/app_function.dart';
import 'package:standard_project/core/variables/app_constant.dart';
import 'package:standard_project/module/ab/profileukm/data/model/visi_model.dart';
import 'package:standard_project/module/ab/profileukm/data/repo/visimisi_repo.dart';
import 'package:dio/dio.dart' as DioPlugin;
import 'package:dio/dio.dart';

class VisiMisiController extends GetxController with VisiMisiRepo {
  RxList<DataVisi> visiData = <DataVisi>[].obs;
  ScrollController scrollController = ScrollController();

  // Variabel Search
  TextEditingController searchController = TextEditingController();

  Future<void> getVisi() async {
    var searchText = userId;
    try {
      final Dio _dio = Dio();
      final response =
          await _dio.get('http://localhost:3000/api/visi/${searchText}');

      VisiModel value = VisiModel.fromJson(response.data);

      if (value.data!.isNotEmpty) {
        visiData.value = value.data!;
      } else {
        AppConstant().setSnackbar("UKM Tidak Ditemukan");
      }
    } catch (e) {
      throw Exception(null);
    }
  }

  // Text Editor Controllers
  TextEditingController userIdTextController = TextEditingController();
  TextEditingController visionTextController = TextEditingController();
  TextEditingController missionTextController = TextEditingController();

  Future<void> insertVisionMissionData() async {
    var data = {
      "user_id": userIdTextController.text,
      "vision": visionTextController.text,
      "mission": missionTextController.text,
    };
    try {
      final Dio _dio = Dio();
      final response = await _dio.post(
        'http://localhost:3000/api/visi/new',
        data: data,
      );

      Get.back();
      getVisi();
    } catch (e) {
      throw Exception(null);
    }
  }

  Future<void> updateVisionMissionData(id) async {
    var data = {
      "id": id,
      "user_id": userIdTextController.text,
      "vision": visionTextController.text,
      "mission": missionTextController.text,
    };
    try {
      final Dio _dio = Dio();
      final response = await _dio.post(
        'http://localhost:3000/api/visi/update',
        data: data,
      );

      Get.back();
      getVisi();
    } catch (e) {
      throw Exception(null);
    }
  }

  Future<void> deleteVisionMissionData(id) async {
    var data = {"id": "$id"};
    try {
      final Dio _dio = Dio();
      final response = await _dio.post(
        'http://localhost:3000/api/visionMission/delete',
        data: data,
      );
      Get.back();
      getVisi();
    } catch (e) {
      throw Exception(null);
    }
  }
}
