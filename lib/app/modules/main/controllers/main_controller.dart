/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 19/03/2026, 16:40
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final PageController pageController = PageController();
  int currentIndex = 0;

  void onSwipePageIndex(int index) {
    currentIndex = index;
    update();
  }

  void onTapIndex(int index) {
    pageController.jumpToPage(index);
    update();
  }
}
