import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class CryptoWalletPage extends GetView<CryptoWalletController> {
  const CryptoWalletPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("CryptoWalletPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CryptoWalletController>(
      init: CryptoWalletController(),
      id: "crypto_wallet",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("crypto_wallet")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
