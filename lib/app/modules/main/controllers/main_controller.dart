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
