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
