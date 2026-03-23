/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 22/03/2026, 13:59
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  bool hasNotification = true;

  late AnimationController animController;
  var isLoading = false.obs;

  String get title => 'Home Controller';

  Future<void> refreshData() async {
    if (isLoading.value) return;

    isLoading.value = true;
    animController.repeat();
    update();

    try {
      await Future.delayed(const Duration(seconds: 2));
    } finally {
      await animController.animateTo(1.0, curve: Curves.linear);

      animController.reset();
      isLoading.value = false;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    animController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void onClose() {
    animController.dispose();
    super.onClose();
  }
}
