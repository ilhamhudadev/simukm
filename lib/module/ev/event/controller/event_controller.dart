import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/globalcontroller/app_function.dart';
import 'package:standard_project/core/variables/app_constant.dart';
import 'package:standard_project/module/ev/event/data/model/event_model.dart';

import 'package:standard_project/module/ev/event/data/repo/event_repo.dart';
import 'package:dio/dio.dart' as DioPlugin;
import 'package:dio/dio.dart';

class EventController extends GetxController with EventRepo {
  RxList<DataEvent> eventData = <DataEvent>[].obs;
  ScrollController scrollController = ScrollController();

  // Variabel Search
  TextEditingController searchController = TextEditingController();

  Future<void> getEvent() async {
    var searchText = userId;
    try {
      final Dio _dio = Dio();
      final response =
          await _dio.get('http://localhost:3000/api/event/${searchText}');
      var value = EventModel.fromJson(response.data);

      if (value.data!.isNotEmpty) {
        eventData.value = value.data!;
      } else {
        AppConstant().setSnackbar("UKM Tidak Ditemukan");
      }
    } catch (e) {
      throw Exception(null);
    }
  }

  // Text Editor Controllers
  TextEditingController userIdTextController = TextEditingController();
  TextEditingController eventDateTextController = TextEditingController();
  TextEditingController eventNameTextController = TextEditingController();
  TextEditingController eventDescriptionTextController =
      TextEditingController();
  TextEditingController eventAttachmentTextController = TextEditingController();

  Future<void> insertEventData() async {
    var data = {
      "user_id": userIdTextController.text,
      "event_date": eventDateTextController.text,
      "event_name": eventNameTextController.text,
      "event_description": eventDescriptionTextController.text,
      "event_attachment": eventAttachmentTextController.text,
    };
    try {
      final Dio _dio = Dio();
      final response = await _dio.post(
        'http://localhost:3000/api/event/new',
        data: data,
      );

      Get.back();
      getEvent();
    } catch (e) {
      throw Exception(null);
    }
  }

  Future<void> updateEventData(id) async {
    var data = {
      "id": id,
      "user_id": userIdTextController.text,
      "event_date": eventDateTextController.text,
      "event_name": eventNameTextController.text,
      "event_description": eventDescriptionTextController.text,
      "event_attachment": eventAttachmentTextController.text,
    };
    try {
      final Dio _dio = Dio();
      final response = await _dio.post(
        'http://localhost:3000/api/event/update',
        data: data,
      );

      Get.back();
      getEvent();
    } catch (e) {
      throw Exception(null);
    }
  }

  Future<void> deleteEventData(id) async {
    var data = {"id": "$id"};
    try {
      final Dio _dio = Dio();
      final response = await _dio.post(
        'http://localhost:3000/api/event/delete',
        data: data,
      );
      Get.back();
      getEvent();
    } catch (e) {
      throw Exception(null);
    }
  }
}
