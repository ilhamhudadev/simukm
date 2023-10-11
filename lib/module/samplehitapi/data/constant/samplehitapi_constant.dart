import 'package:standard_project/core/api/api_model.dart';

class SampleHitAPIConstant {
  static ApiModel urlAPIWilayah = ApiModel(
      url: '/BMKG-importer/cuaca/wilayah.json',
      method: ApiMethodType.get,
      requiredToken: false,
      description: 'Get API Wilayah');
}