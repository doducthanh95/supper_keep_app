import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supper_keep_money/core/app_export.dart';
import 'package:supper_keep_money/widgets/appbar_default.dart';
import 'package:supper_keep_money/widgets/container_default.dart';
import 'package:supper_keep_money/widgets/image_widget.dart';

import 'index.dart';
import 'models/currency_model.dart';

class ListCurrencyUnitPage extends GetView<ListCurrencyUnitController> {
  ListCurrencyUnitPage({Key? key}) : super(key: key);

  final _controller = ListCurrencyUnitController();

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        AppBarDefault(
          title: 'Currency',
          onBack: () {
            _controller.onBack();
          },
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final _model = _controller.listCurrencySupport[index];
                  return _buildItem(model: _model, index: index);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 16,
                  );
                },
                itemCount: _controller.listCurrencySupport.length),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListCurrencyUnitController>(
      init: _controller,
      id: "list_currency_unit",
      builder: (_) {
        return Scaffold(
          body: ContainerDefault(
            child: _buildView(),
          ),
        );
      },
    );
  }

  Widget _buildItem({CurrencyModel? model, required int index}) {
    return InkWell(
      onTap: () {
        _controller.changeSelect(index);
      },
      child: Row(
        children: [
          ImageApp(
            url: model?.urlIcon,
            width: 36,
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
                  model?.title ?? '',
                  style: AppStyle.t16M,
                ),
                Text(
                  (model?.subTitle ?? '') + ' - ' + (model?.symbol ?? ''),
                  style: AppStyle.t14M.apply(color: AppColors.yellow300),
                )
              ],
            ),
          ),
          Visibility(
            visible: index == _controller.indexSelect.value,
            child: Icon(
              Icons.check,
              color: AppColors.yellow500,
            ),
          )
        ],
      ),
    );
  }
}
