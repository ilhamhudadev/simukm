import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/globalcontroller/app_function.dart';
import 'package:standard_project/core/variables/app_constant.dart';
import 'package:standard_project/module/ab/profileukm/data/model/structure_model.dart';
import 'package:standard_project/module/ab/profileukm/data/repo/organizationStruktur_repo.dart';
import 'package:dio/dio.dart' as DioPlugin;
import 'package:dio/dio.dart';

class OrganizationStrukturController extends GetxController
    with OraganizationStrukturRepo {
  RxList<DataStructure> structureData = <DataStructure>[].obs;
  ScrollController scrollController = ScrollController();

  // Variabel Search
  TextEditingController searchController = TextEditingController();

  Future<void> getStructureLetter() async {
    var searchText = userId;
    try {
      final Dio _dio = Dio();
      final response =
          await _dio.get('http://localhost:3000/api/structure/${searchText}');

      StructureModel value = StructureModel.fromJson(response.data);

      if (value.data!.isNotEmpty) {
        structureData.value = value.data!;
      } else {
        AppConstant().setSnackbar("UKM Tidak Ditemukan");
      }
    } catch (e) {
      throw Exception(null);
    }
  }

  // Text Editor Controllers
  TextEditingController userIdTextController = TextEditingController();
  TextEditingController managementYearTextController = TextEditingController();
  TextEditingController adviserTextController = TextEditingController();
  TextEditingController presidentTextController = TextEditingController();
  TextEditingController vicePresidentTextController = TextEditingController();
  TextEditingController membersTextController = TextEditingController();

  Future<void> insertStructureData() async {
    var data = {
      "user_id": userIdTextController.text,
      "management_year": managementYearTextController.text,
      "adviser": adviserTextController.text,
      "president": presidentTextController.text,
      "vice_president": vicePresidentTextController.text,
      "member": membersTextController.text,
    };
    try {
      final Dio _dio = Dio();
      final response = await _dio.post(
        'http://localhost:3000/api/structure/new',
        data: data,
      );

      Get.back();
      getStructureLetter();
    } catch (e) {
      throw Exception(null);
    }
  }

  Future<void> updateStructureData(id) async {
    var data = {
      "id": id,
      "user_id": userIdTextController.text,
      "management_year": managementYearTextController.text,
      "adviser": adviserTextController.text,
      "president": presidentTextController.text,
      "vice_president": vicePresidentTextController.text,
      "member": membersTextController.text,
    };
    try {
      final Dio _dio = Dio();
      final response = await _dio.post(
        'http://localhost:3000/api/structure/update',
        data: data,
      );

      Get.back();
      getStructureLetter();
    } catch (e) {
      throw Exception(null);
    }
  }

  Future<void> deleteStructureData(id) async {
    var data = {"id": "$id"};
    try {
      final Dio _dio = Dio();
      final response = await _dio.post(
        'http://localhost:3000/api/structure/delete',
        data: data,
      );
      Get.back();
      getStructureLetter();
    } catch (e) {
      throw Exception(null);
    }
  }
}
