/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 24/03/2026, 00:17
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:get/get.dart';

import '../controllers/unknown_controller.dart';

class UnknownBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UnknownController>(() => UnknownController());
  }
}
