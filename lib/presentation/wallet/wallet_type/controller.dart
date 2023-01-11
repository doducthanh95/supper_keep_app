import 'package:get/get.dart';
import 'package:supper_keep_money/core/app_export.dart';
import 'package:supper_keep_money/routes/app_routes.dart';

class WalletTypeController extends GetxController {
  WalletTypeController();

  _initData() {
    update(["wallet_type"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  void gotoCreationBasicWallet() {
    Get.toNamed(AppRoutes.walletCreationScreen);
  }
}
