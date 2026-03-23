/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 05/08/2025, 14:36
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:get/get.dart';

import '../../../core/controller/theme_controller.dart';
import '../../../data/repository/auth/auth_repository.dart';
import '../../../routes/app_pages.dart';

class SettingController extends GetxController {
  final AuthRepository authRepository = Get.find();
  final ThemeController themeController = Get.find();

  Future<void> switchTheme(bool themeValue) async {
    Get.back();
    await Future.delayed(Duration(milliseconds: 300), () {
      themeController.switchTheme(themeValue);
    });
  }

  void logout() {
    Get.offAllNamed(Routes.LOGIN, arguments: authRepository.setAuthentication(false));
  }
}
