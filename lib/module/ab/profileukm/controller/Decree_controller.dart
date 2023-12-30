import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/globalcontroller/app_function.dart';
import 'package:standard_project/core/variables/app_constant.dart';
import 'package:standard_project/module/ab/profileukm/data/model/decision_letter_model.dart';
import 'package:standard_project/module/ab/profileukm/data/repo/decree_repo.dart';
import 'package:dio/dio.dart' as DioPlugin;
import 'package:dio/dio.dart';

class DecreeController extends GetxController with DecreeRepo {
  RxList<DataDecision> decisionLetterData = <DataDecision>[].obs;
  ScrollController scrollController = ScrollController();

  // Variabel Search
  TextEditingController searchController = TextEditingController();

  Future<void> getDecisionLetter() async {
    var searchText = userId;
    try {
      final Dio _dio = Dio();
      final response =
          await _dio.get('http://localhost:3000/api/decision/${searchText}');

      DecisionModel value = DecisionModel.fromJson(response.data);
      debugPrint("hasil keputusan : ${response.data}");
      if (value.data!.isNotEmpty) {
        decisionLetterData.value = value.data!;
      } else {
        AppConstant().setSnackbar("UKM Tidak Ditemukan");
      }
    } catch (e) {
      throw Exception(null);
    }
  }

  // Text Editor Controllers
  TextEditingController userIdTextController = TextEditingController();
  TextEditingController decisionNumberTextController = TextEditingController();
  TextEditingController decisionTitleTextController = TextEditingController();
  TextEditingController decisionDateTextController = TextEditingController();
  TextEditingController letterAttachmentTextController =
      TextEditingController();

  Future<void> insertDecisionLetterData() async {
    var data = {
      "user_id": userIdTextController.text,
      "decision_number": decisionNumberTextController.text,
      "decision_title": decisionTitleTextController.text,
      "decision_date": decisionDateTextController.text,
      "letter_attachment": letterAttachmentTextController.text,
    };
    try {
      final Dio _dio = Dio();
      final response = await _dio.post(
        'http://localhost:3000/api/decision/new',
        data: data,
      );

      Get.back();
      getDecisionLetter();
    } catch (e) {
      throw Exception(null);
    }
  }

  Future<void> updateDecisionLetterData(id) async {
    var data = {
      "id": id,
      "user_id": userIdTextController.text,
      "decision_number": decisionNumberTextController.text,
      "decision_title": decisionTitleTextController.text,
      "decision_date": decisionDateTextController.text,
      "letter_attachment": letterAttachmentTextController.text,
    };
    try {
      final Dio _dio = Dio();
      final response = await _dio.post(
        'http://localhost:3000/api/decision/update',
        data: data,
      );

      Get.back();
      getDecisionLetter();
    } catch (e) {
      throw Exception(null);
    }
  }

  Future<void> deleteDecisionLetterData(id) async {
    var data = {"id": "$id"};
    try {
      final Dio _dio = Dio();
      final response = await _dio.post(
        'http://localhost:3000/api/decision/delete',
        data: data,
      );
      Get.back();
      getDecisionLetter();
    } catch (e) {
      throw Exception(null);
    }
  }
}
