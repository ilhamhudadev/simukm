import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/variables/app_constant.dart';
import 'package:standard_project/module/pr/proposal/data/model/proposal_model.dart';
import 'package:standard_project/module/pr/proposal/data/repo/proposal_repo.dart';
import 'package:dio/dio.dart' as DioPlugin;
import 'package:dio/dio.dart';

class ProposalController extends GetxController with ProposalRepo {
  RxList<DataProposal> proposalData = <DataProposal>[].obs;
  ScrollController scrollController = ScrollController();

  // Variabel Search
  TextEditingController searchController = TextEditingController();

  Future<void> getProposalLetter() async {
    var searchText = searchController.value.text;
    try {
      final Dio dio = Dio();
      final response =
          await dio.get('http://localhost:3000/api/proposal/${searchText}');

      ProposalModel value = ProposalModel.fromJson(response.data);

      if (value.data!.isNotEmpty) {
        proposalData.value = value.data!;
      } else {
        AppConstant().setSnackbar("UKM Tidak Ditemukan");
      }
    } catch (e) {
      throw Exception(null);
    }
  }

  // Text Editor Controllers
  TextEditingController userIdTextController = TextEditingController();
  TextEditingController dateTextController = TextEditingController();
  TextEditingController titleTextController = TextEditingController();
  TextEditingController locationTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();
  TextEditingController documentationTextController = TextEditingController();

  Future<void> insertProposalData() async {
    var data = {
      "user_id": userIdTextController.text,
      "date": dateTextController.text,
      "title": titleTextController.text,
      "location": locationTextController.text,
      "description": descriptionTextController.text,
      "documentation": documentationTextController.text,
    };
    try {
      final Dio dio = Dio();
      final response = await dio.post(
        'http://localhost:3000/api/proposal/new',
        data: data,
      );

      Get.back();
      getProposalLetter();
    } catch (e) {
      throw Exception(null);
    }
  }

  Future<void> updateProposalData(id) async {
    var data = {
      "id": id,
      "user_id": userIdTextController.text,
      "date": dateTextController.text,
      "title": titleTextController.text,
      "location": locationTextController.text,
      "description": descriptionTextController.text,
      "documentation": documentationTextController.text,
    };
    try {
      final Dio dio = Dio();
      final response = await dio.post(
        'http://localhost:3000/api/proposal/update',
        data: data,
      );

      Get.back();
      getProposalLetter();
    } catch (e) {
      throw Exception(null);
    }
  }

  Future<void> deleteProposalData(id) async {
    var data = {"id": "$id"};
    try {
      final Dio dio = Dio();
      final response = await dio.post(
        'http://localhost:3000/api/proposal/delete',
        data: data,
      );
      Get.back();
      getProposalLetter();
    } catch (e) {
      throw Exception(null);
    }
  }
}
