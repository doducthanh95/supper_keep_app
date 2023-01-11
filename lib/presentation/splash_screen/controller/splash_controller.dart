import 'package:get/get.dart';
import 'package:supper_keep_money/presentation/splash_screen/models/splash_model.dart';
import 'package:supper_keep_money/routes/app_routes.dart';

class SplashController extends GetxController {
  Rx<SplashModel> splashscreenModelObj = SplashModel().obs;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 1000), () {
      Get.toNamed(AppRoutes.rootNaviScreen);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
