import 'package:flutter/material.dart';
import 'package:supper_keep_money/core/app_export.dart';

class ContainerDefault extends StatelessWidget {
  final Widget? child;
  const ContainerDefault({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppPath.imBackground), fit: BoxFit.cover)),
      child: child,
    );
  }
}
