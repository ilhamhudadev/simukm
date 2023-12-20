import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/variables/app_constant.dart';
import 'package:standard_project/module/ab/profileukm/data/model/report_model.dart';

import 'package:standard_project/module/ab/profileukm/data/repo/report_repo.dart';
import 'package:dio/dio.dart' as DioPlugin;
import 'package:dio/dio.dart';

class ReportController extends GetxController with Reportrepo {
  RxList<DataReport> reportData = <DataReport>[].obs;
  ScrollController scrollController = ScrollController();

  // Variabel Search
  TextEditingController searchController = TextEditingController();

  Future<void> getReportLetter() async {
    var searchText = searchController.value.text;
    try {
      final Dio _dio = Dio();
      final response =
          await _dio.get('http://localhost:3000/api/report/${searchText}');

      ReportModel value = ReportModel.fromJson(response.data);

      if (value.data!.isNotEmpty) {
        reportData.value = value.data!;
      } else {
        AppConstant().setSnackbar("UKM Tidak Ditemukan");
      }
    } catch (e) {
      throw Exception(null);
    }
  }
}
