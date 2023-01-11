import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supper_keep_money/core/app_export.dart';
import 'package:supper_keep_money/widgets/appbar_default.dart';
import 'package:supper_keep_money/widgets/container_default.dart';

import 'index.dart';

class TransactionNotePage extends GetView<TransactionNoteController> {
  TransactionNotePage({Key? key}) : super(key: key);

  final _controller = TransactionNoteController();

  Widget _buildView() {
    return Column(
      children: [
    SizedBox(
      height: 40,
    ),
    CardDefaultWidget(
      width: size.width - 40,
      child: TextField(
        minLines: 10,
        maxLines: 12,
        style: AppStyle.t16M.apply(color: Colors.white),
        decoration: InputDecoration(
            border: InputBorder.none, hintText: 'note to here'),
      ),
    ),
    SizedBox(
      height: 30,
    ),
    ButtonDefaultWidget(
      title: 'Save',
    )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionNoteController>(
      init: _controller,
      id: "transaction_note",
      builder: (_) {
        return Scaffold(
          body: ContainerDefault(
            child: Column(
              children: [
                AppBarDefault(
                  title: 'Note',
                ),
                Expanded(child: _buildView()),
              ],
            ),
          ),
        );
      },
    );
  }
}
