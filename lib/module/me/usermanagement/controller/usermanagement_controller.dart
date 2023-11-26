import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/variables/app_constant.dart';
import 'package:standard_project/module/me/usermanagement/data/model/users_model.dart';
import 'package:standard_project/module/me/usermanagement/data/repo/usermanagement_repo.dart';
import 'package:dio/dio.dart' as DioPlugin;
import 'package:dio/dio.dart';

class UsermanagementController extends GetxController with UsermanagementRepo {
  // Variabel Model User Management List
  RxList<Data> userListData = <Data>[].obs;
  ScrollController scrollController = ScrollController();

  // Variabel Search
  TextEditingController searchController = TextEditingController();

  // Function Hit API
  Future<void> getUsersManagementData() async {
    var searchText = searchController.value.text;
    try {
      final Dio _dio = Dio();
      final response =
          await _dio.get('http://localhost:3000/api/user/${searchText}');

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

  // Edit Text Editor Controller
  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController igTextController = TextEditingController();
  TextEditingController twitterTextController = TextEditingController();
  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController youtubeTextController = TextEditingController();
  TextEditingController shortNameTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }
}
