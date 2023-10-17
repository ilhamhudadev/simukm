
  //Example of Repo
  //You might not use it
  import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:standard_project/module/pr/proposal/data/model/user_management.dart';

class ProposalRepo {
  //   // final _myNetwork = ProposalNetwork();
  
  //   // Every function should have repo as prefix
  
   Future<void> repoFunc() async {
      try {
  //      servFunc();
       } catch (e) {
         rethrow;
       }
     }
  
Future<List<ProposalModel>> fetchProposal() async {
    debugPrint("Print Wilayah");
    try {
      final Dio _dio = Dio();
      final response = await _dio
          .get('https://ibnux.github.io/BMKG-importer/cuaca/wilayah.json');

      debugPrint("Print Wilayah 1 ${response.data}");

      List<ProposalModel> data = proposalListFromJson(response.data);

      debugPrint("Print Wilayah 4 ");
      return data;
    } catch (e) {
      throw Exception(null);
    }
  }  }
  
