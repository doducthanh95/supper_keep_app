import 'package:flutter/material.dart';
import 'package:supper_keep_money/core/app_export.dart';
import 'package:supper_keep_money/widgets/image_widget.dart';

class WalletDefaultWidget extends StatefulWidget {
  final String? urlIcon;
  final String? title;
  final double? amount;
  final bool? isCheck;
  const WalletDefaultWidget(
      {Key? key, this.urlIcon, this.title, this.amount, this.isCheck})
      : super(key: key);

  @override
  State<WalletDefaultWidget> createState() => _WalletDefaultWidgetState();
}

class _WalletDefaultWidgetState extends State<WalletDefaultWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CardDefaultWidget(
      child: Row(
        children: [
          ImageApp(
            url: widget.urlIcon ?? '',
            width: 24,
            height: 24,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title ?? '',
                style: AppStyle.t20M.apply(color: AppColors.orange400),
              ),
              Text(
                '3.000',
                style: AppStyle.t20B,
              )
            ],
          )),
          Icon(
            Icons.check,
            color: AppColors.yellow500,
          )
        ],
      ),
    ));
  }
}
