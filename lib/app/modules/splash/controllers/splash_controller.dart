import 'package:flutter_foundation_getx/app/data/repository/auth/auth_repository.dart';
import 'package:get/get.dart';

import '../../../../style/color.dart';
import '../../../core/util/app_config.dart';
import '../../../data/repository/splash/splash_repository.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final SplashRepository splashRepository;
  final AuthRepository authRepository = Get.find();

  var progressValue = 0.0.obs;
  var progressColor = AppColors.mainColorLight.obs;

  SplashController({required this.splashRepository});

  @override
  void onReady() {
    super.onReady();
    themeController.switchTheme(splashRepository.getTheme());
    routeConfig();
  }

  void routeConfig() async {
    const totalDuration = 3000;
    const updateInterval = 50;

    for (int i = 0; i <= totalDuration; i += updateInterval) {
      await Future.delayed(const Duration(milliseconds: updateInterval));
      progressValue.value = i / totalDuration;

      if (progressValue.value >= 0.99) {
        progressColor.value = AppColors.mainColor;
      } else {
        progressColor.value = AppColors.mainColorLight;
      }

      if (progressValue.value > 1.0) {
        progressValue.value = 1.0;
      }
    }

    if (authRepository.getAuthentication() == true) {
      Get.offNamed(Routes.MAIN);
    } else {
      if (splashRepository.showOnboarding() == false) {
        Get.offNamed(Routes.ONBOARDING);
      } else {
        Get.offNamed(Routes.LOGIN);
      }
    }
  }
}
