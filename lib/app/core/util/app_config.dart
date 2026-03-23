/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 22/03/2026, 02:41
 * Copyright (c) 2026.
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
