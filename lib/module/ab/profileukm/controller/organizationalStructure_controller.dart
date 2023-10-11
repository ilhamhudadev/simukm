import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/module/ab/profileukm/data/model/organizationStruktur_model.dart';
import 'package:standard_project/module/ab/profileukm/data/repo/organizationStruktur_repo.dart';

class OrganizationStrukturController extends GetxController
    with OraganizationStrukturRepo {
  ScrollController scrollController = ScrollController();

  Future<List<WilayahModel>> futureWilayah() {
    return fetchWilayah();
  }
}
