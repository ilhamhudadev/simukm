import 'package:standard_project/core/api/api_client.dart';
import 'package:standard_project/module/ab/profileukm/data/model/wilayah_indonesia_model.dart';
import 'package:dio/dio.dart' as Diopugin;

class SampelCuacaRepo {
  Future<void> repoFunc() async {
    try {} catch (e) {
      rethrow;
    }
  }

  Future<WilayahModel> fetchClaimPolicyData(Url, model, productNoData) async {
    try {
      DioPlugin.Response response = await ApiClient()
          .postData(apiModel: Url, parameter: 'productNumber=$productNoData');

      model = WilayahModel.fromJson(response.data);
      return model;
    } catch (e) {
      throw Exception();
    }
  }
}
