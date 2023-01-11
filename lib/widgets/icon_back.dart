import 'dart:io';

import 'package:flutter/material.dart';

import '../core/app_export.dart';

class IconBack extends StatelessWidget {
  final Function? onBack;
  const IconBack({Key? key, this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => this.onBack ?? Get.back(),
        icon: Icon(
          Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
          color: AppColors.yellow500,
          size: 30,
        ));
  }
}
