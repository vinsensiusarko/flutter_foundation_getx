/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 22/03/2026, 07:08
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter_foundation_getx/app/core/helper/shared_pref.dart';
import 'package:flutter_foundation_getx/theme/app_theme.dart';
import 'package:get/get.dart';

class ApplicationController extends GetxController {
  final SharedPreferencesManager sharedPreferencesManager;

  ApplicationController({required this.sharedPreferencesManager});

  AppTheme _appTheme = AppTheme.fromType(ThemeType.light);
  AppTheme get appTheme => _appTheme;
  Rx<bool?> get isDarkTheme => sharedPreferencesManager.getBool('isDarkTheme').obs;

  /// Update theme
  void updateTheme(AppTheme theme) {
    _appTheme = theme;
    Get.forceAppUpdate();
  }
}