import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foundation_getx/app/core/util/error_flutter_screen.dart';
import 'package:flutter_foundation_getx/app/modules/unknown/views/unknown_view.dart';
import 'package:get/get.dart';

import 'app/core/binding/main_binding.dart';
import 'app/core/controller/theme_controller.dart';
import 'app/core/helper/shared_pref.dart';
import 'app/data/constant/application_constant.dart';
import 'app/modules/unknown/bindings/unknown_binding.dart';
import 'app/routes/app_pages.dart';
import 'theme/app_theme.dart';

void main() async {
  if (kDebugMode) {
    flutterErrorScreen();
  }
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager.init();
  runApp(const FlutterFoundationGetx());
}

class FlutterFoundationGetx extends StatelessWidget {
  const FlutterFoundationGetx({super.key});

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
          child: SafeArea(
            top: false,
            bottom: false,
            maintainBottomViewPadding: true,
            child: child!,
          ),
        );
      },
      debugShowCheckedModeBanner: false,
      initialBinding: MainBinding(),
      title: Application.applicationName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      unknownRoute: GetPage(
        name: AppPages.UNKNOWN,
        page: () => const UnknownView(),
        binding: UnknownBinding(),
      ),
      defaultTransition: Platform.isAndroid ? Transition.native : Transition.cupertino,
      theme: AppTheme.fromType(ThemeType.light).themeData,
      darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
      themeMode: ThemeController().theme,
    );
  }
}
