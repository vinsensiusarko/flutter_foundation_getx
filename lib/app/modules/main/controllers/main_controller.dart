import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../../news/views/news_view.dart';
import '../../setting/views/setting_view.dart';

class MainController extends GetxController {
  int currentIndex = 0;

  final List<Widget> screenList = [
    const HomeView(),
    const NewsView(),
    const SettingView(),
  ];

  void onTapIndex(int index) {
    currentIndex = index;
    update();
  }
}
