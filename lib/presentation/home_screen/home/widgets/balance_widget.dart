import 'package:supper_keep_money/core/app_export.dart';
import 'package:supper_keep_money/presentation/home_screen/home/widgets/line_chart_widget.dart';

class BalanceWidget extends StatefulWidget {
  const BalanceWidget({Key? key}) : super(key: key);

  @override
  State<BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildBalancerWidget(),
    );
  }

  _buildBalancerWidget() {
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: EdgeInsets.only(left: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wellcome',
                      style: AppStyle.t18M,
                    ),
                    Text(
                      'DO DUC THANH',
                      style: AppStyle.t24B,
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.yellow500, // darker color
                ),
                BoxShadow(
                  color: AppColors.backgroundSecond, // background color
                  spreadRadius: 5.0,
                  blurRadius: 12.0,
                ),
              ],
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Your total balance',
                    style: AppStyle.t14M.apply(color: Colors.white70),
                  ),
                  Text(
                    '2,000,000đ',
                    style: AppStyle.t30B.apply(color: AppColors.yellow500),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
