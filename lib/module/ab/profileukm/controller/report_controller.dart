import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/globalcontroller/app_function.dart';
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
  RxList<DataReport> search(String keyword) {
    // Jika kata kunci pencarian kosong, kembalikan semua data
    if (keyword.isEmpty) {
      return reportData;
    }

    // Lakukan pencarian berdasarkan kata kunci
    RxList<DataReport> result = reportData
        .where((data) => data.reportTitle!.contains(keyword))
        .toList()
        .obs;

    return result;
  }

  Future<void> getReportLetter() async {
    var searchText = userId;
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

  // Text Editor Controllers
  TextEditingController userIdTextController = TextEditingController();
  TextEditingController reportDateTextController = TextEditingController();
  TextEditingController reportTitleTextController = TextEditingController();
  TextEditingController responsiblePartyTextController =
      TextEditingController();
  TextEditingController reportContentTextController = TextEditingController();
  TextEditingController attachmentTextController = TextEditingController();

  Future<void> insertReportData() async {
    var data = {
      "user_id": userIdTextController.text,
      "report_date": reportDateTextController.text,
      "report_title": reportTitleTextController.text,
      "responsible_party": responsiblePartyTextController.text,
      "report_content": reportContentTextController.text,
      "attachment": attachmentTextController.text,
    };
    try {
      final Dio _dio = Dio();
      final response = await _dio.post(
        'http://localhost:3000/api/report/new',
        data: data,
      );

      Get.back();
      getReportLetter();
    } catch (e) {
      throw Exception(null);
    }
  }

  Future<void> updateReportData(id) async {
    var data = {
      "id": id,
      "user_id": userIdTextController.text,
      "report_date": reportDateTextController.text,
      "report_title": reportTitleTextController.text,
      "responsible_party": responsiblePartyTextController.text,
      "report_content": reportContentTextController.text,
      "attachment": attachmentTextController.text,
    };
    try {
      final Dio _dio = Dio();
      final response = await _dio.post(
        'http://localhost:3000/api/report/update',
        data: data,
      );

      Get.back();
      getReportLetter();
    } catch (e) {
      throw Exception(null);
    }
  }

  Future<void> deleteReportData(id) async {
    var data = {"id": "$id"};
    try {
      final Dio _dio = Dio();
      final response = await _dio.post(
        'http://localhost:3000/api/report/delete',
        data: data,
      );
      Get.back();
      getReportLetter();
    } catch (e) {
      throw Exception(null);
    }
  }
}
