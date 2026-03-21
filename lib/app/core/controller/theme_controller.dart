/*
 * Created by Vinsensius Arko on 14/07/2025, 17:22
 * vinsensiusarka@gmail.com
 * Last modified 14/07/2025, 17:22
 * Copyright (c) 2025.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter_foundation_getx/app/core/helper/shared_pref.dart';
import 'package:flutter_foundation_getx/app/core/util/app_config.dart';
import 'package:flutter_foundation_getx/theme/app_theme.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final SharedPreferencesManager sharedPreferencesManager;

  ThemeController({required this.sharedPreferencesManager});

  /// Key for storing theme
  final _themeKey = "isDarkTheme";

  /// Get isDarkMode info from local storage and return ThemeMode
  ThemeMode get theme => _loadThemeMode() ? ThemeMode.dark : ThemeMode.light;

  /// Load isDarkMode from local storage and if it's empty, returns false (that means default theme is light)
  bool _loadThemeMode() {
    return sharedPreferencesManager.getBool(_themeKey);
  }

  /// Save isDarkMode to local storage
  Future<void> _saveThemeMode(bool isDarkMode) async {
    await sharedPreferencesManager.putBool(_themeKey, isDarkMode);
  }

  /// Switch theme and save to local storage
  Future<void> switchTheme(bool themeValue) async {
    if (themeValue) {
      _saveThemeMode(themeValue);
      appController.isDarkTheme.value = themeValue;
      appController.updateTheme(AppTheme.fromType(ThemeType.dark));
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      _saveThemeMode(themeValue);
      appController.isDarkTheme.value = themeValue;
      appController.updateTheme(AppTheme.fromType(ThemeType.light));
      Get.changeThemeMode(ThemeMode.light);
    }
    update();
  }
}