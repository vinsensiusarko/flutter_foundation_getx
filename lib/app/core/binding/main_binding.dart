/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 22/03/2026, 07:13
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:get/get.dart';

import '../../data/repository/auth/auth_repository.dart';
import '../controller/application_controller.dart';
import '../controller/auth_controller.dart';
import '../controller/theme_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    /// Controller
    Get.put<ThemeController>(ThemeController(sharedPreferencesManager: Get.find()), permanent: true);
    Get.put<ApplicationController>(ApplicationController(sharedPreferencesManager: Get.find()), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);

    /// Repository
    Get.put<AuthRepository>(AuthRepository(sharedPreferencesManager: Get.find()));
  }
}