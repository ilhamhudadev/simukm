import 'package:get/get.dart';
import 'package:standard_project/core/network/status_network_manager.dart';

class StatusNetworkBinding extends Bindings {
  // dependence injection attach our class.
  @override
  void dependencies() {
    Get.lazyPut<StatusNetworkManager>(() => StatusNetworkManager());
  }
}
