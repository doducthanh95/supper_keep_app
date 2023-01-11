import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supper_keep_money/core/app_export.dart';
import 'package:supper_keep_money/widgets/container_default.dart';

import 'index.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: CircleAvatar(
              radius: 60,
            ),
          ),
          Text(
            'do duc thanh',
            style: AppStyle.t24M,
          ),
          _buildListSettings(),
          SizedBox(
            height: 20,
          ),
          _buildListSettings(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Text(
              'Version 1.0.0',
              style: AppStyle.t14M,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      id: "profile",
      builder: (_) {
        return Scaffold(
          body: ContainerDefault(
            child: _buildView(),
          ),
        );
      },
    );
  }

  _buildListSettings() {
    return Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white.withOpacity(0.05),
        ),
        child: Column(
          children: [
            RowDefaulfWidget(
              icon: AppPath.icSetting,
              title: 'Upgrade pro',
            ),
            Divider(
              color: Colors.white54,
            ),
            RowDefaulfWidget(
              icon: AppPath.icSetting,
              title: 'Language',
            ),
            Divider(
              color: Colors.white54,
            ),
            RowDefaulfWidget(
              icon: AppPath.icSetting,
              title: 'Curency',
            ),
          ],
        ));
  }
}
