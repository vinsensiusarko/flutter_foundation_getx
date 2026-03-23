/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 24/07/2025, 02:36
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter_foundation_getx/app/data/repository/auth/auth_repository.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final AuthRepository authRepository = Get.find();

  void login() {
    Get.offNamed(
      Routes.MAIN,
      arguments: authRepository.setAuthentication(true),
    );
  }
}
