/*
 * Created by Vinsensius Arko on 15/07/2025, 23:28
 * vinsensiusarka@gmail.com
 * Last modified 15/07/2025, 23:28
 * Copyright (c) 2025.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter_foundation_getx/app/core/helper/shared_pref.dart';
import 'package:flutter_foundation_getx/app/core/util/dimensions.dart';
import 'package:flutter_foundation_getx/theme/app_theme.dart';
import 'package:get/get.dart';

class ApplicationController extends GetxController with WidgetsBindingObserver {

  AppTheme _appTheme = AppTheme.fromType(ThemeType.light);
  AppTheme get appTheme => _appTheme;
  Rx<bool?> isDarkTheme = SharedPreferencesManager.getBool('isDarkTheme').obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Dimensions.init();
    });
  }

  /// Update theme
  void updateTheme(AppTheme theme) {
    _appTheme = theme;
    Get.forceAppUpdate();
  }
}