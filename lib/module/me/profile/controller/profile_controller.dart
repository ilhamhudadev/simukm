
  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/module/me/profile/data/model/profile_model.dart';
  import 'package:standard_project/module/me/profile/data/repo/profile_repo.dart';
  class ProfileController extends GetxController with ProfileRepo {
  ScrollController scrollController = ScrollController();

  Future<UserModel> futureUser(){
    return fetchUser();
  }
  }