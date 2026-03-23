/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 19/03/2026, 16:14
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter_foundation_getx/app/data/repository/splash/splash_repository.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashRepository>(() => SplashRepository(sharedPreferencesManager: Get.find()));
    Get.lazyPut<SplashController>(() => SplashController(splashRepository: Get.find()));
  }
}
