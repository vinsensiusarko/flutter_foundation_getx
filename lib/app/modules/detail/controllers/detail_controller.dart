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
