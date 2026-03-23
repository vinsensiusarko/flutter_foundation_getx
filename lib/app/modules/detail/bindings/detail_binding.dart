/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 21/07/2025, 15:54
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController());
  }
}
