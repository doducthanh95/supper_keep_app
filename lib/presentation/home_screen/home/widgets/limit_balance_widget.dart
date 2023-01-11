import 'package:supper_keep_money/core/app_export.dart';

class LimitBalanceWidget extends StatefulWidget {
  const LimitBalanceWidget({Key? key}) : super(key: key);

  @override
  State<LimitBalanceWidget> createState() => _LimitBalanceWidgetState();
}

class _LimitBalanceWidgetState extends State<LimitBalanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CardDefaultWidget(
        width: size.width - 40,
        child: Column(
          children: [
            Text(
              'Limit for this month',
              style: AppStyle.t14R.apply(color: Colors.white54),
            ),
            Text(
              '5,000,000đ',
              style: AppStyle.t24B,
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.yellow300),
                ),
                Container(
                  height: 20,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.orange500),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '1/12/2022 - 31/12/2022',
                  style: AppStyle.t14M,
                ))
          ],
        ),
      ),
    );
  }
}
