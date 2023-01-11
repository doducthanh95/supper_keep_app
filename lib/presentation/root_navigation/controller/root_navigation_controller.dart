import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:supper_keep_money/routes/app_routes.dart';

class RootNavigationController extends GetxController {
  final iconList = [
    Icons.home,
    Icons.account_balance_wallet,
    Icons.add_circle_rounded,
    Icons.newspaper,
    Icons.account_circle_rounded
  ];

  

  var activeIndex = 0.obs;

  void gotoTransactionType() {
    Get.toNamed(AppRoutes.transactionTypePage);
  }

}
