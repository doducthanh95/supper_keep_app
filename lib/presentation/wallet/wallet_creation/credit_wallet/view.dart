import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class CreditWalletPage extends GetView<CreditWalletController> {
  const CreditWalletPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("CreditWalletPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreditWalletController>(
      init: CreditWalletController(),
      id: "credit_wallet",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("credit_wallet")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
