import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:standard_project/core/globalcontroller/app_function.dart';
import 'package:standard_project/core/route/route_constant.dart';
import 'package:standard_project/core/variables/app_constant.dart';
import 'package:standard_project/module/me/signin/data/repo/signin_repo.dart';
import 'package:dio/dio.dart';
import 'package:standard_project/module/me/usermanagement/data/model/users_model.dart';

class SigninController extends GetxController with SigninRepo {
  RxList<Data> userListData = <Data>[].obs;
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  Future<void> postLoginUser() async {
    var data = {
      "password": passwordTextController.text,
      "email": emailTextController.text,
    };
    try {
      final Dio _dio = Dio();
      final response = await _dio
          .post('http://localhost:3000/api/user/ukm/login', data: data);

      UsersModel value = UsersModel.fromJson(response.data);

      if (value.data!.isNotEmpty) {
        userListData.value = value.data!;
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user_email', value.data![0].email!);
        prefs.setString('user_id', value.data![0].id!);
        prefs.setBool('is_logged_in', true);
        userId = value.data![0].id!;
        Get.toNamed(RouteConstant.sidebar);
      } else {
        AppConstant().setSnackbar("UKM Tidak Ditemukan");
      }
    } catch (e) {
      AppConstant().setSnackbar("UKM Tidak Ditemukan");
      throw Exception(null);
    }
  }
}
