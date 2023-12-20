import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    var searchText = searchController.value.text;
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
}
