import 'package:get/get.dart';
import 'package:supper_keep_money/presentation/list_currency_unit/index.dart';
import 'package:supper_keep_money/presentation/profile/index.dart';
import 'package:supper_keep_money/presentation/root_navigation/root_navigation_screen.dart';
import 'package:supper_keep_money/presentation/splash_screen/binding/splash_binding.dart';
import 'package:supper_keep_money/presentation/splash_screen/splash_screen.dart';
import 'package:supper_keep_money/presentation/transaction/transaction_category/index.dart';
import 'package:supper_keep_money/presentation/transaction/transaction_note/index.dart';
import 'package:supper_keep_money/presentation/transaction/transaction_screen/binding/transction_binding.dart';
import 'package:supper_keep_money/presentation/transaction/transaction_screen/index.dart';
import 'package:supper_keep_money/presentation/transaction/transaction_type.dart';
import 'package:supper_keep_money/presentation/wallet/index.dart';
import 'package:supper_keep_money/presentation/wallet/wallet_creation/basic_wallet/index.dart';
import 'package:supper_keep_money/presentation/wallet/wallet_type/view.dart';

class AppRoutes {
  static String splashScreen = '/splashscreen_screen';

  static String initialRoute = '/initialRoute';

  static String rootNaviScreen = '/root_navigation_screen';

  //* transaction
  static String transactionTypePage = '/transaction_type_screen';

  static String transactionScreen = '/transaction_screen';

  static String transactionCategoryScreen = '/transaction_category_screen';

  static String transactionNoteScreen = '/transaction_note_screen';

  //* wallet
  static String walletScreen = '/wallet_screen';

  static String walletTypeScreen = '/wallet_type_screen';

  static String walletCreationScreen = '/wallet_creation_screen';

  static String profileScreen = '/profile_screen';

  //* list currency
  static String currencyUnitScreen = '/currency_unit_screen';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: rootNaviScreen,
      page: () => RootNavigationScreen(),
    ),
    GetPage(name: transactionTypePage, page: () => TransactionTypePage()),
    GetPage(
        name: transactionScreen,
        page: () => TransactionScreenPage(),
        bindings: [TransactionBinding()]),
    GetPage(
        name: transactionCategoryScreen, page: () => TransactionCategoryPage()),
    GetPage(name: transactionNoteScreen, page: () => TransactionNotePage()),
    GetPage(name: walletScreen, page: () => WalletPage()),
    GetPage(name: walletTypeScreen, page: () => WalletTypePage()),
    GetPage(name: walletCreationScreen, page: () => WalletCreationPage()),
    GetPage(name: profileScreen, page: () => ProfilePage()),
    GetPage(name: currencyUnitScreen, page: () => ListCurrencyUnitPage()),
  ];
}

extension GetRouter on GetInterface {
  Future<T?>? toReplaceWithNamed<T>(
    String page, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    if (preventDuplicates && page == currentRoute) {
      return null;
    }

    if (parameters != null) {
      final uri = Uri(path: page, queryParameters: parameters);
      page = uri.toString();
    }

    return global(id).currentState?.pushReplacementNamed(
          page,
          arguments: arguments,
        );
  }
}
