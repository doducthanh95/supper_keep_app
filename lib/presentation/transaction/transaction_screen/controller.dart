import 'package:get/get.dart';
import 'package:supper_keep_money/presentation/transaction/transaction_category/index.dart';
import 'package:supper_keep_money/routes/app_routes.dart';

class TransactionScreenController extends GetxController {
  TransactionScreenController();

  var isOnSwitch = false.obs;

  _initData() {
    update(["transaction_screen"]);
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

  void changeSwichRepot({bool? isOn}) {
    isOnSwitch.value = isOn ?? false;
  }

  void goToTransactionCategoryScreen() {
    Get.toNamed(AppRoutes.transactionCategoryScreen);
  }

  void gotoTransactionNoteScreen() {
    Get.toNamed(AppRoutes.transactionNoteScreen);
  }
}
