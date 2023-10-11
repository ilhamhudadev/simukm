import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/module/ab/profileukm/data/model/decree_model.dart';
import 'package:standard_project/module/ab/profileukm/data/repo/decree_repo.dart';

class DecreeController extends GetxController with DecreeRepo {
  ScrollController scrollController = ScrollController();

  Future<List<DecreeModel>> futureDecree() {
    return fetchDecree();
  }
}
