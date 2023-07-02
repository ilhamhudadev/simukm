import 'dart:convert';

import 'package:standard_project/core/api/api_client.dart';
import 'package:standard_project/module/preview/data/constant/preview_constant.dart';
import 'package:standard_project/module/preview/data/model/listing_video_model.dart';
import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:dio/dio.dart' as DioPlugin;
import 'package:http/http.dart' as http;

class PreviewRepo {
  Future<ListingVideoModel> fetchListingVideo() async {
    try {
      final responseData = await http.get(Uri.parse(
          'https://itunes.apple.com/search?term=jack+johnson&entity=musicVideo'));

      if (responseData.statusCode == 200) {
        print(responseData.body);
      } else {
        print('Failed to fetch data');
      }

      var jsonString = jsonDecode(responseData.body);
      // DioPlugin.Response response = await ApiClient().postData(
      //   apiModel: PreviewURL.fetchListingVideo,
      // );
      print("fetch api data 3");
      ListingVideoModel model = ListingVideoModel();
      print("fetch api data 4");
      model = ListingVideoModel.fromJson(jsonString);
      print("fetch api data 5");
      return model;
    } catch (e) {
      print("fetch api data 6");
      throw Exception(null);
    }
  }
}
