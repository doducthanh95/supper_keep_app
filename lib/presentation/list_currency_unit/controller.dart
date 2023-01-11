import 'package:get/get.dart';
import 'package:supper_keep_money/core/app_export.dart';
import 'package:supper_keep_money/presentation/list_currency_unit/models/currency_model.dart';

class ListCurrencyUnitController extends GetxController {
  ListCurrencyUnitController();

  final listCurrencySupport = [
    CurrencyModel(
        urlIcon: AppPath.icVietNam,
        title: 'Việt Nam Đồng',
        symbol: 'đ',
        subTitle: 'VND'),
    CurrencyModel(
        urlIcon: AppPath.icUnitedStates,
        title: 'Unit State Dollar',
        symbol: '\$',
        subTitle: 'USD'),
    CurrencyModel(
        urlIcon: AppPath.icEuro, title: 'Euro', subTitle: 'EUR', symbol: '€'),
    CurrencyModel(
        urlIcon: AppPath.icThailand,
        title: 'Baht',
        subTitle: 'THB',
        symbol: '฿'),
    CurrencyModel(
        urlIcon: AppPath.icEnglish,
        title: 'Pound',
        subTitle: 'GBP',
        symbol: '£'),
    CurrencyModel(
        urlIcon: AppPath.icJapan, title: 'Yen', subTitle: 'JPY', symbol: '¥'),
    CurrencyModel(
        urlIcon: AppPath.icKorea, title: 'Won', subTitle: 'KRW', symbol: '₩'),
  ];

  var indexSelect = 0.obs;

  _initData() {
    update(["list_currency_unit"]);
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

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void changeSelect(int select) {
    indexSelect.value = select;
    update(['list_currency_unit']);
    onBack();
  }

  void onBack() {
    Get.back(result: listCurrencySupport[indexSelect.value]);
  }
}
