import 'package:flutter/material.dart';
import 'package:flutter_foundation_getx/app/core/util/dimensions.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterLogo(size: Dimensions.loginImg),
                SizedBox(height: Dimensions.height30),
                Obx(() {
                  return SizedBox(
                    width: Dimensions.width45 * 4,
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                      value: controller.progressValue.value,
                      minHeight: 10,
                      backgroundColor: Colors.grey[300],
                      color: controller.progressColor.value,
                    ),
                  );
                }),
                const SizedBox(height: 10),
                Obx(() {
                  return Text(
                    '${(controller.progressValue.value * 100).toInt()}%',
                    style: const TextStyle(fontSize: 16),
                  );
                })
              ],
            ),
          ),
        );
      }
    );
  }
}
