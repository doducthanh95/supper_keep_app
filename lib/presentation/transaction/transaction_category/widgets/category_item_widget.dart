import 'package:flutter/material.dart';
import 'package:supper_keep_money/core/app_export.dart';
import 'package:supper_keep_money/widgets/image_widget.dart';

class CategoryItemWidget extends StatelessWidget {
  final String? iconUrl;
  final String? title;
  final double? width;
  const CategoryItemWidget({Key? key, this.iconUrl, this.title, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? size.width / 3,
        padding: EdgeInsets.only(left: 4, right: 4),
        alignment: Alignment.center,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                child: ImageApp(
                  url: iconUrl ?? '',
                  width: getHorizontalSize(25),
                  height: getHorizontalSize(25),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                title ?? '',
                style: AppStyle.t16M,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
