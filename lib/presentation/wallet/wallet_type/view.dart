import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supper_keep_money/core/app_export.dart';
import 'package:supper_keep_money/widgets/appbar_default.dart';
import 'package:supper_keep_money/widgets/container_default.dart';
import 'package:supper_keep_money/widgets/image_widget.dart';

import 'index.dart';

class WalletTypePage extends GetView<WalletTypeController> {
  WalletTypePage({Key? key}) : super(key: key);

  final _controller = WalletTypeController();
  // 主视图
  Widget _buildView() {
    return Column(children: [
      InkWell(
          onTap: () {
            _controller.gotoCreationBasicWallet();
          },
          child: _buildItemWallet(title: 'Basic Wallet')),
      SizedBox(
        height: 20,
      ),
      _buildItemWallet(title: 'Credit Wallet'),
      SizedBox(
        height: 20,
      ),
      _buildItemWallet(title: 'Crypto Wallet'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletTypeController>(
      init: _controller,
      id: "wallet_type",
      builder: (_) {
        return Scaffold(
          body: ContainerDefault(
            child: Column(
              children: [
                AppBarDefault(
                  title: 'Wallet type',
                ),
                Expanded(child: _buildView()),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildItemWallet({String? url, String? title}) {
    return CardDefaultWidget(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(children: [
          ImageApp(
            url: url,
            width: 40,
            height: 40,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title ?? '',
            style: AppStyle.t20M,
          ),
        ]),
      ),
    );
  }
}
