import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:supper_keep_money/core/app_export.dart';
import 'package:supper_keep_money/widgets/appbar_default.dart';
import 'package:supper_keep_money/widgets/container_default.dart';
import 'package:supper_keep_money/widgets/custom_keyboard.dart';
import 'package:supper_keep_money/widgets/image_widget.dart';

import 'index.dart';

class WalletCreationPage extends GetView<WalletCreationController> {
  WalletCreationPage({Key? key}) : super(key: key);

  final _controller = WalletCreationController();

  Widget _buildView() {
    return Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CircleAvatar(
                  radius: 40,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 6),
                  child: Text(
                    'Change',
                    style: AppStyle.t12B,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CardDefaultWidget(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, top: 10, left: 4, right: 4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildNameWallet(),
                    Divider(
                      color: Colors.white54,
                    ),
                    _buildAmount(),
                    Divider(
                      color: Colors.white54,
                    ),
                    _buildCurrency(),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.white54,
                    ),
                    _buildCategory(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ButtonDefaultWidget(
              title: 'Save',
              onTap: () {
                Get.back();
              },
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletCreationController>(
      init: _controller,
      id: "wallet_creation",
      builder: (_) {
        return Scaffold(
          body: ContainerDefault(
              child: Stack(
            children: [
              Column(
                children: [
                  AppBarDefault(
                    title: 'Wallet creation',
                  ),
                  Expanded(child: _buildView()),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SlidingUpPanel(
                  isDraggable: false,
                  controller: _controller.panelController,
                  color: AppColors.backgroundPri,
                  margin: EdgeInsets.zero,
                  minHeight: 0,
                  panel: CustomKeyboard(
                    panelController: _controller.panelController,
                    onTextInput: _controller.onTextInput,
                    onBackspace: _controller.onBackspace,
                  ),
                ),
              )
            ],
          )),
        );
      },
    );
  }

  _buildNameWallet() {
    return Row(
      children: [
        ImageApp(
          width: 30,
          height: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
            style: AppStyle.t16M,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusColor: AppColors.yellow500,
              hintText: 'Name wallet',
              hintStyle: AppStyle.t14M.apply(color: AppColors.yellow300),
            ),
          ),
        ),
      ],
    );
  }

  _buildAmount() {
    return Row(
      children: [
        ImageApp(
          width: 30,
          height: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
            controller: _controller.amountEditController,
            style: AppStyle.t20M,
            keyboardType: TextInputType.none,
            onTap: () {
              _controller.panelController.animatePanelToPosition(0.65);
              _controller.amountEditController.selection = TextSelection(
                  baseOffset: 0,
                  extentOffset: _controller.amountEditController.text.length);
            },
            decoration: InputDecoration(
              focusColor: AppColors.yellow500,
              hoverColor: AppColors.yellow500,
              hintText: 'Amount',
              hintStyle: AppStyle.t14M.apply(color: AppColors.yellow300),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  _buildCurrency() {
    return InkWell(
      onTap: () {
        _controller.gotoListCurrency();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          children: [
            ImageApp(
              width: 30,
              height: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Currency Unit',
                  style: AppStyle.t12R.apply(color: AppColors.yellow400),
                ),
                Text(
                  _controller.currencyModel.value.subTitle ?? 'VND',
                  style: AppStyle.t16M,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  _buildCategory() {
    return InkWell(
      onTap: () {
        _controller.gotoCategoryScreen();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          children: [
            ImageApp(
              width: 30,
              height: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: AppStyle.t12R.apply(color: AppColors.yellow400),
                ),
                Text(
                  'Standard categories',
                  style: AppStyle.t16M,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
