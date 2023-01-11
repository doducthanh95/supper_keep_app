import 'package:flutter/material.dart';
import 'package:supper_keep_money/core/app_export.dart';
import 'package:supper_keep_money/widgets/image_widget.dart';

class RowDefaulfWidget extends StatelessWidget {
  final String? icon;
  final String? title;
  final Color? color;
  final Function? onTap;

  const RowDefaulfWidget(
      {Key? key, this.icon, this.title, this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        padding: EdgeInsets.only(top: 12, bottom: 12),
        child: Row(children: [
          Expanded(
              flex: 1,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ImageApp(
                    url: icon ?? '',
                    width: 26,
                    height: 26,
                    color: color,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          SizedBox(
            width: 20,
          ),
          Expanded(
              flex: 4,
              child: Text(
                title ?? '',
                style: AppStyle.t16M.apply(color: AppColors.yellow500),
              )),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.grey,
            size: 18,
          )
        ]),
      ),
    );
  }
}
