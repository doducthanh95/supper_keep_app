import 'package:get/get.dart';
import 'package:supper_keep_money/presentation/transaction/models/record_model.dart';

class TransactionCategoryController extends GetxController {
  TransactionCategoryController();

  _initData() {
    update(["transaction_category"]);

    final _m = RecordNormal();
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
}
