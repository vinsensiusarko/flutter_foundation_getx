/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 24/03/2026, 00:04
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {

  final homeScreenList = PageStorageKey<String>('newsScreenList');
  final discountList = PageStorageKey<String>('discounList');

  final String title = 'News';

  List<int> itemDiscount = [1, 2, 3, 4, 5];
  RxBool showAllItems = false.obs;

  void showMoreDiscount() {
    showAllItems.value = !showAllItems.value;
    update();
  }
}
