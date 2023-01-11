import 'package:flutter/cupertino.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:supper_keep_money/core/app_export.dart';
import 'package:table_calendar/table_calendar.dart';

import 'index.dart';

class TransactionScreenPage extends GetView<TransactionScreenController> {
  TransactionScreenPage({Key? key}) : super(key: key);

  final FocusNode _nodeText1 = FocusNode();
  final _controller = TransactionScreenController();

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          focusNode: _nodeText1,
          footerBuilder: (_) => PreferredSize(
              child: SizedBox(
                  height: 40,
                  child: Center(
                    child: Text('Done'),
                  )),
              preferredSize: Size.fromHeight(40)),
        ),
      ],
    );
  }

  Widget _buildView(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppPath.imBackground), fit: BoxFit.cover)),
      child: Column(
        children: [_buildAppBar(), Expanded(child: _buildListContent(context))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionScreenController>(
      init: _controller,
      id: "transaction_screen",
      builder: (_) {
        return Scaffold(body: _buildView(context));
      },
    );
  }

  Widget _buildAppBar() {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconBack(),
            ),
          ),
          Text(
            'Thêm giao dịch',
            style: AppStyle.t20B.apply(color: AppColors.yellow500),
          )
        ],
      ),
    );
  }

  Widget _buildListContent(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          _buildGroupMoney(context),
          _buildNotCalculateReport(),
          SizedBox(
            height: 40,
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: ButtonDefaultWidget(title: 'Lưu'))
        ],
      ),
    );
  }

  Widget _buildGroupMoney(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white54.withOpacity(0.2)),
      child: Column(
        children: [
          TransactionInputMoneyWidget(),
          LineWidget(),
          RowDefaulfWidget(
            icon: AppPath.imageNotFound,
            title: 'Mua sắm',
            onTap: () {
              _controller.goToTransactionCategoryScreen();
            },
          ),
          LineWidget(),
          RowDefaulfWidget(
            icon: AppPath.icCalendar,
            title: 'Tuseday, 27/12/2022',
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return TableCalendar(
                      firstDay: DateTime(DateTime.now().year,
                          DateTime.now().month - 3, DateTime.now().day),
                      lastDay: DateTime(DateTime.now().year,
                          DateTime.now().month + 3, DateTime.now().day),
                      focusedDay: DateTime.now(),
                      calendarFormat: CalendarFormat.month,
                      locale: 'en_En',
                    );
                  });
            },
          ),
          LineWidget(),
          RowDefaulfWidget(
            icon: AppPath.icEdit,
            title: 'Ghi chú',
            onTap: () {
              _controller.gotoTransactionNoteScreen();
            },
          ),
          LineWidget(),
          RowDefaulfWidget(
            icon: AppPath.icMoneyCash,
            title: 'Tiền mặt',
            // color: AppColors.yellow500,
          ),
        ],
      ),
    );
  }

  Widget _buildNotCalculateReport() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      padding: EdgeInsets.only(left: 16, top: 6, bottom: 6, right: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white54.withOpacity(0.2)),
      child: Row(children: [
        Expanded(child: Text('Không tính vào báo cáo', style: AppStyle.t16M)),
        Obx(() => CupertinoSwitch(
            activeColor: AppColors.orange500,
            trackColor: Colors.grey,
            value: controller.isOnSwitch.value,
            onChanged: (isOne) {
              controller.changeSwichRepot(isOn: isOne);
            }))
      ]),
    );
  }
}
