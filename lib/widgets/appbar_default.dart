import 'package:flutter/material.dart';
import 'package:supper_keep_money/core/app_export.dart';

class AppBarDefault extends StatelessWidget {
  final String? title;
  final Function? onBack;
  const AppBarDefault({Key? key, this.title, this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildAppBar();
  }

  Widget _buildAppBar() {
    return SafeArea(
      child: Container(
        height: 40,
        child: Stack(
          alignment: AlignmentDirectional.center,
          fit: StackFit.loose,
          children: [
            Center(
              child: Text(
                title ?? '',
                style: AppStyle.t20B.apply(color: AppColors.yellow500),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconBack(
                  onBack: onBack,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
