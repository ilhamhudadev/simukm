import 'package:get/get.dart';
import 'package:standard_project/core/variables/app_constant.dart';
import 'package:standard_project/module/main/sidebar/data/model/dashboard_model.dart';
import 'package:standard_project/module/main/sidebar/data/repo/sidebar_repo.dart';
import 'package:dio/dio.dart' as DioPlugin;
import 'package:dio/dio.dart';

class SidebarController extends GetxController with SidebarRepo {
  RxString eventCount = "".obs;
  RxString laporanCount = "".obs;
  RxString skCount = "".obs;
  RxString proposalCount = "".obs;
  RxString organisasiCount = "".obs;

  Future<void> getDashboardData() async {
    try {
      final Dio _dio = Dio();
      final response =
          await _dio.get('http://localhost:3000/api/user/dashboard');

      DashboardModel value = DashboardModel.fromJson(response.data);
      Data count = value.data!;
      if (value.statusCode == 200) {
        eventCount.value = count.totalEvent!.rowCount.toString();
        laporanCount.value = count.totalLPJ!.rowCount.toString();
        skCount.value = count.totalSK!.rowCount.toString();
        proposalCount.value = count.totalProposal!.rowCount.toString();
        organisasiCount.value = count.totalOrganisasi!.rowCount.toString();
      } else {
        AppConstant().setSnackbar("UKM Tidak Ditemukan");
      }
    } catch (e) {
      throw Exception(null);
    }
  }
}
