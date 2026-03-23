/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 22/03/2026, 07:15
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter_foundation_getx/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_foundation_getx/app/modules/news/controllers/news_controller.dart';
import 'package:flutter_foundation_getx/app/modules/setting/controllers/setting_controller.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<NewsController>(() => NewsController(), fenix: true);
    Get.lazyPut<SettingController>(() => SettingController(), fenix: true);
  }
}
