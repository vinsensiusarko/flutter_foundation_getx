/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 21/07/2025, 15:56
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:get/get.dart';

class DetailController extends GetxController {
  late Map<String, dynamic> detailData;
  late int id;
  late String title;
  late String body;

  @override
  void onInit() {
    super.onInit();
    detailData = Get.arguments;
    id = detailData['id'];
    title = detailData['title'];
    body = detailData['body'];
  }
}
