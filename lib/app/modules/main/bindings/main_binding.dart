import 'package:flutter_foundation_getx/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_foundation_getx/app/modules/news/controllers/news_controller.dart';
import 'package:flutter_foundation_getx/app/modules/setting/controllers/setting_controller.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<NewsController>(() => NewsController(), fenix: true);
    Get.lazyPut<SettingController>(() => SettingController(), fenix: true);
    Get.lazyPut<MainController>(() => MainController());
  }
}
