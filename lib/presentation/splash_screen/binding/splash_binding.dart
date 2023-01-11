import 'package:get/get.dart';
import 'package:supper_keep_money/presentation/splash_screen/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
