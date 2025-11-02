import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {

  final homeScreenList = PageStorageKey<String>('newsScreenList');
  final discountList = PageStorageKey<String>('discounList');

  List<int> itemDiscount = [1, 2, 3, 4, 5];
  RxBool showAllItems = false.obs;

  void showMoreDiscount() {
    showAllItems.value = !showAllItems.value;
    update();
  }
}
