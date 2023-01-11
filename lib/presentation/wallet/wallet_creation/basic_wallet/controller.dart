import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:sqflite/utils/utils.dart';
import 'package:supper_keep_money/core/app_export.dart';
import 'package:supper_keep_money/presentation/list_currency_unit/models/currency_model.dart';
import 'package:supper_keep_money/routes/app_routes.dart';

class WalletCreationController extends GetxController {
  WalletCreationController();

  final currencyFormat = '0.00'.obs;
  var _amount = '';
  final amountEditController = TextEditingController();
  final PanelController panelController = PanelController();

  var currencyModel = CurrencyModel().obs;

  _initData() {
    update(["wallet_creation"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  void gotoCategoryScreen() {
    Get.toNamed(AppRoutes.transactionCategoryScreen);
  }

  void gotoListCurrency() async {
    Get.toNamed(AppRoutes.currencyUnitScreen)?.then((value) {
      currencyModel.value = value;
      update(['wallet_creation']);
    });
  }

  String _formatCurrencyMoney({String? text}) {
    final _d = double.tryParse(text ?? '0') ?? 0;
    final currencyFormatter =
        NumberFormat.currency(symbol: '', decimalDigits: 2);
    currencyFormat.value = currencyFormatter.format(_d); // 100.286.020.524,17
    return currencyFormat.value;
  }

  void onTextInput(String text) {
    _amount += text;
    if (text == '.') {
      amountEditController.text = currencyFormat.value + '.';
      return;
    }
    amountEditController.text = _formatCurrencyMoney(text: _amount);
  }

  void onBackspace() {
    if (_amount.isEmpty) {
      amountEditController.text = '';
      return;
    }
    final _newText = _amount.substring(0, _amount.length - 1);
    _amount = _newText;
    amountEditController.text = _formatCurrencyMoney(text: _amount);
  }
}
