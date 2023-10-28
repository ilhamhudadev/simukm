
  import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
  import 'package:standard_project/module/pr/proposal/data/repo/proposal_repo.dart';
  import 'package:standard_project/module/pr/proposal/data/model/user_management.dart';

  class ProposalController extends GetxController with ProposalRepo {
    
    ScrollController scrollController = ScrollController();

  Future<List<ProposalModel>> futureWilayah() {
    return fetchProposal();
  }

  }