/*
 * Created by Vinsensius Arko on 08/12/2024, 05:38
 * vinsensiusarka@gmail.com
 * Last modified 08/12/2024, 02:47
 * Copyright (c) 2024.
 * All rights reserved.
 */

import 'package:flutter_foundation_getx/app/core/controller/application_controller.dart';
import 'package:flutter_foundation_getx/app/core/controller/theme_controller.dart';
import 'package:get/get.dart';

ApplicationController get appController {
  if (Get.isRegistered<ApplicationController>()) {
    return Get.find<ApplicationController>();
  } else {
    return Get.put(ApplicationController(sharedPreferencesManager: Get.find()));
  }
}

ThemeController get themeController {
  if (Get.isRegistered<ThemeController>()) {
    return Get.find<ThemeController>();
  } else {
    return Get.put(ThemeController(sharedPreferencesManager: Get.find()));
  }
}
