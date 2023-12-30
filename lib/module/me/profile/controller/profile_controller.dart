import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:standard_project/core/globalcontroller/app_function.dart';
import 'package:standard_project/core/variables/app_constant.dart';
import 'package:standard_project/module/me/profile/data/model/profile_model.dart';
import 'package:standard_project/module/me/profile/data/repo/profile_repo.dart';
import 'package:standard_project/module/me/usermanagement/data/model/users_model.dart';

class ProfileController extends GetxController with ProfileRepo {
  ScrollController scrollController = ScrollController();
  RxList<Data> userListData = <Data>[].obs;
  Future<UserModel> futureUser() {
    return fetchUser();
  }

  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController igTextController = TextEditingController();
  TextEditingController twitterTextController = TextEditingController();
  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController youtubeTextController = TextEditingController();
  TextEditingController shortNameTextController = TextEditingController();

  Future<void> getUsersManagementData() async {
    var searchText = userId;
    try {
      final Dio _dio = Dio();
      final response = await _dio
          .get('http://localhost:3000/api/organization/${searchText}');

      UsersModel value = UsersModel.fromJson(response.data);

      if (value.data!.isNotEmpty) {
        userListData.value = value.data!;
      } else {
        AppConstant().setSnackbar("UKM Tidak Ditemukan");
      }
    } catch (e) {
      throw Exception(null);
    }
  }

  Future<void> updateUsersManagementData(id) async {
    var data = {
      "id": id,
      "organizationName": nameTextController.text,
      "password": passwordTextController.text,
      "shortName": shortNameTextController.text,
      "history": "Sejarah",
      "contactNumber": phoneNumberTextController.text,
      "email": emailTextController.text,
      "ig": igTextController.text,
      "youtube": youtubeTextController.text,
      "twitter": twitterTextController.text,
      "username": usernameTextController.text,
    };
    try {
      final Dio _dio = Dio();
      final response = await _dio
          .post('http://localhost:3000/api/organization/update', data: data);

      Get.back();
      getUsersManagementData();
    } catch (e) {
      throw Exception(null);
    }
  }
}
