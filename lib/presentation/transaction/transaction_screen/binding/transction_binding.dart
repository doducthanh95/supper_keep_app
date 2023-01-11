import 'package:get/get.dart';
import 'package:supper_keep_money/presentation/splash_screen/controller/splash_controller.dart';
import 'package:supper_keep_money/presentation/transaction/transaction_screen/controller.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransactionScreenController());
  }
}
