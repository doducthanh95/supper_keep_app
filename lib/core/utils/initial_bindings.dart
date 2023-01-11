

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:supper_keep_money/core/network/network_info.dart';
import 'package:supper_keep_money/core/utils/pref_utils.dart';
import 'package:supper_keep_money/data/apiClient/api_client.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}
