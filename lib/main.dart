import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supper_keep_money/core/utils/initial_bindings.dart';
import 'package:supper_keep_money/core/utils/logger.dart';
import 'package:supper_keep_money/localization/app_localization.dart';
import 'package:supper_keep_money/routes/app_routes.dart';

import 'core/app_export.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      builder: DevicePreview.appBuilder,
      // title: 'gymxxy',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
