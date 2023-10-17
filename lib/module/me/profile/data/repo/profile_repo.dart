import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:standard_project/module/me/profile/data/model/profile_model.dart';

class ProfileRepo {
  Future<void> repoFunc() async {
    try {} catch (e) {
      rethrow;
    }
  }

  Future<UserModel> fetchUser() async {
    debugPrint("Print user 1");
    try {
      final Dio _dio = Dio();
      final response = await _dio.get('https://api.agify.io/?name=bella');

      debugPrint("Print user 2 ${response.data}");

      UserModel data = UserModel.fromJson(response.data[0]);

      debugPrint("Print Wilayah 3 ");
      return data;
    } catch (e) {
      throw Exception(null);
    }
  }
}
