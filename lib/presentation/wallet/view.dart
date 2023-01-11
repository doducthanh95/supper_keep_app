import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supper_keep_money/core/app_export.dart';
import 'package:supper_keep_money/presentation/wallet/widgets/wallet_default_widget.dart';
import 'package:supper_keep_money/widgets/container_default.dart';
import 'package:supper_keep_money/widgets/image_widget.dart';

import 'index.dart';

class WalletPage extends GetView<WalletController> {
  WalletPage({Key? key}) : super(key: key);

  final _controller = WalletController();

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        SafeArea(
            child: Text(
          'My Wallets',
          style: AppStyle.t24B,
        )),
        SizedBox(
          height: 30,
        ),
        _controller.wallets.isEmpty
            ? _buildEmpty()
            : SingleChildScrollView(
                child: ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return WalletDefaultWidget(
                        urlIcon: AppPath.icAtm,
                        title: 'Total',
                        amount: 6000000,
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                    itemCount: 4)),
        SizedBox(
          height: 40,
        ),
        ButtonDefaultWidget(
          title: 'Add wallet',
          onTap: () {
            _controller.goToWalletCreationPage();
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
      init: _controller,
      id: "wallet",
      builder: (_) {
        return Scaffold(
          body: ContainerDefault(
            child: _buildView(),
          ),
        );
      },
    );
  }

  Widget _buildEmpty() {
    return Column(
      children: [
        ImageApp(
          url: AppPath.imageNotFound,
          width: 100,
          height: 100,
          fit: BoxFit.fill,
        ),
        Text(
          'Sorry, you don\'t have wallet',
          style: AppStyle.t16M.apply(color: AppColors.yellow300),
        )
      ],
    );
  }
}
