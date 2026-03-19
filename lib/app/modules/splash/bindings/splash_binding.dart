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
