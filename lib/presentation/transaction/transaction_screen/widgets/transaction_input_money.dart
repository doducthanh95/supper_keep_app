import 'package:supper_keep_money/core/app_export.dart';

class TransactionInputMoneyWidget extends StatefulWidget {
  final Function? onChangeCurrency;
  final Function(double)? onChangeMoney;

  const TransactionInputMoneyWidget(
      {Key? key, this.onChangeCurrency, this.onChangeMoney})
      : super(key: key);

  @override
  State<TransactionInputMoneyWidget> createState() =>
      _TransactionInputMoneyWidgetState();
}

class _TransactionInputMoneyWidgetState
    extends State<TransactionInputMoneyWidget> {
  final _controller = TextEditingController(text: '0');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.text = '0';
  }

  @override
  Widget build(BuildContext context) {
    return _buildRowInputMoney();
  }

  Widget _buildRowInputMoney() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: InkWell(
              onTap: () {
                widget.onChangeCurrency?.call();
              },
              child: Container(
                padding: EdgeInsets.all(6),
                alignment: Alignment.center,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey)),
                child: Text(
                  'VND',
                  style: AppStyle.t14M.apply(color: AppColors.yellow500),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Số tiền',
                  style: AppStyle.t14M.apply(color: AppColors.yellow300),
                ),
                TextFormField(
                  onTap: () => _controller.selection = TextSelection(
                      baseOffset: 0,
                      extentOffset: _controller.value.text.length),
                  onFieldSubmitted: (value) {
                    widget.onChangeMoney?.call(double.parse(value));
                  },
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  style: AppStyle.t30B.apply(color: AppColors.yellow500),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                  ),
                )
              ],
            ))
      ],
    );
  }
}
