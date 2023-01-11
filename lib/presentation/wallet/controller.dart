import 'package:get/get.dart';
import 'package:supper_keep_money/presentation/wallet/models/wallet_model.dart';
import 'package:supper_keep_money/routes/app_routes.dart';

class WalletController extends GetxController {
  WalletController();

  final wallets = <WalletModel>[];

  _initData() {
    update(["wallet"]);
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

  void goToWalletCreationPage() {
    Get.toNamed(AppRoutes.walletTypeScreen);
  }
}
