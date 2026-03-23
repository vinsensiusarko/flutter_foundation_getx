/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 19/07/2025, 00:45
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter_foundation_getx/app/data/repository/splash/splash_repository.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final SplashRepository splashRepository = Get.find();
  PageController pageController = PageController();
  int pageIndex = 0;

  void setPageIndex(int index) {
    pageIndex = index;
    update();
  }
}
