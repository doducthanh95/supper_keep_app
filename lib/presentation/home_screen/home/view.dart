import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supper_keep_money/core/app_export.dart';
import 'package:supper_keep_money/core/utils/image_constant.dart';
import 'package:supper_keep_money/presentation/home_screen/home/widgets/balance_widget.dart';
import 'package:supper_keep_money/presentation/home_screen/home/widgets/limit_balance_widget.dart';
import 'package:supper_keep_money/presentation/home_screen/home/widgets/line_chart_widget.dart';
import 'package:supper_keep_money/presentation/home_screen/home/widgets/pie_chart_spend_widget.dart';
import 'package:supper_keep_money/presentation/home_screen/home/widgets/recent_transfer_widget.dart';
import 'package:supper_keep_money/widgets/card_default.dart';

import 'index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _HomeViewGetX();
  }
}

class _HomeViewGetX extends GetView<HomeController> {
  const _HomeViewGetX({Key? key}) : super(key: key);

  Widget _buildView() {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppPath.imBackground), fit: BoxFit.cover),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BalanceWidget(),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Change balance',
                    style: AppStyle.t20M,
                  ),
                ),
                PieChartSpendWidget(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Change balance',
                    style: AppStyle.t20M,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  LineChartBalance(),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            LimitBalanceWidget(),
            SizedBox(
              height: 30,
            ),
            RecentTransferWidget()
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: "home",
      builder: (_) {
        return Scaffold(
          body: _buildView(),
        );
      },
    );
  }
}
