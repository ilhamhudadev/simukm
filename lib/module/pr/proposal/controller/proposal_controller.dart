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
      final Dio _dio = Dio();
      final response =
          await _dio.get('http://localhost:3000/api/proposal/${searchText}');

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
}
