import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:supper_keep_money/core/app_export.dart';
import 'package:supper_keep_money/presentation/transaction/transaction_category/widgets/category_group_widget.dart';
import 'package:supper_keep_money/widgets/appbar_default.dart';
import 'package:supper_keep_money/widgets/container_default.dart';

import 'index.dart';

class TransactionCategoryPage extends StatefulWidget {
  const TransactionCategoryPage({Key? key}) : super(key: key);

  @override
  _TransactionCategoryPageState createState() =>
      _TransactionCategoryPageState();
}

class _TransactionCategoryPageState extends State<TransactionCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return _TransactionCategoryViewGetX();
  }
}

class _TransactionCategoryViewGetX
    extends GetView<TransactionCategoryController> {
  _TransactionCategoryViewGetX({Key? key}) : super(key: key);

  final _controller = TransactionCategoryController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionCategoryController>(
      init: _controller,
      id: "transaction_category",
      builder: (_) {
        return Scaffold(
            body: ContainerDefault(
                child: Column(
          children: [
            AppBarDefault(
              title: 'Select Category',
            ),
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return CategoryGroupWidget(
                      titleGroup: 'Fashion',
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                  itemCount: 4),
            ),
          ],
        )));
      },
    );
  }
}
