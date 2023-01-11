import 'package:flutter/material.dart';
import 'package:supper_keep_money/core/app_export.dart';
import 'package:supper_keep_money/routes/app_routes.dart';
import 'package:supper_keep_money/widgets/appbar_default.dart';
import 'package:supper_keep_money/widgets/container_default.dart';

class TransactionTypePage extends StatelessWidget {
  const TransactionTypePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerDefault(
        child: Column(
          children: [
            AppBarDefault(
              title: 'Transaction type',
            ),
            InkWell(
              onTap: () => Get.toReplaceWithNamed(AppRoutes.transactionScreen),
              child: CardDefaultWidget(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(
                        'Living Transaction',
                        style: AppStyle.t20M,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            CardDefaultWidget(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      'Crypto Transaction',
                      style: AppStyle.t20M,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
