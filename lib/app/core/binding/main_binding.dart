/*
 * Created by Vinsensius Arko on 19/07/2025, 21:38
 * vinsensiusarka@gmail.com
 * Last modified 19/07/2025, 21:38
 * Copyright (c) 2025.
 * All rights reserved.
 */

import 'package:flutter_foundation_getx/app/core/util/dimensions.dart';
import 'package:get/get.dart';

import '../../data/repository/auth/auth_repository.dart';
import '../controller/application_controller.dart';
import '../controller/auth_controller.dart';
import '../controller/theme_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    /// Utils
    Get.put<Dimensions>(Dimensions());

    /// Controller
    Get.put<ApplicationController>(ApplicationController(), permanent: true);
    Get.put<ThemeController>(ThemeController(), permanent: true);
    Get.put<AuthController>(AuthController());

    /// Repository
    Get.put<AuthRepository>(AuthRepository());
  }
}