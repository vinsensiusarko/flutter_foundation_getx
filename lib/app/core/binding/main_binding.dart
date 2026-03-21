/*
 * Created by Vinsensius Arko on 19/07/2025, 21:38
 * vinsensiusarka@gmail.com
 * Last modified 19/07/2025, 21:38
 * Copyright (c) 2025.
 * All rights reserved.
 */

import 'package:get/get.dart';

import '../../data/repository/auth/auth_repository.dart';
import '../controller/application_controller.dart';
import '../controller/auth_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    /// Controller
    Get.put<ApplicationController>(ApplicationController(sharedPreferencesManager: Get.find()), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);

    /// Repository
    Get.put<AuthRepository>(AuthRepository(sharedPreferencesManager: Get.find()));
  }
}