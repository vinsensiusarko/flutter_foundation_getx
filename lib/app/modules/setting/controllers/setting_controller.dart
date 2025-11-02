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
