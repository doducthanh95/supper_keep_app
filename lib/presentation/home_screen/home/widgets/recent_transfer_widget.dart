import 'package:supper_keep_money/core/app_export.dart';

class RecentTransferWidget extends StatefulWidget {
  const RecentTransferWidget({Key? key}) : super(key: key);

  @override
  State<RecentTransferWidget> createState() => _RecentTransferWidgetState();
}

class _RecentTransferWidgetState extends State<RecentTransferWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Text(
            'Giao dịch gần đây',
            style: AppStyle.t24M,
          ),
          ListView.separated(
              padding: EdgeInsets.only(top: 10),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: RowDefaulfWidget(
                    icon: AppPath.icTransportation,
                    title: 'Test transform 27/12/2022',
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: 5)
        ],
      ),
    );
  }
}
