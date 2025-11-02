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
  return Get.isRegistered<ApplicationController>() ? Get.find<ApplicationController>() : Get.put(ApplicationController());
}

ThemeController get themeController {
  return Get.isRegistered<ThemeController>() ? Get.find<ThemeController>() : Get.put(ThemeController());
}
