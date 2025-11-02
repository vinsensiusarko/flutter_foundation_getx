import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/util/app_config.dart';
import '../../../core/util/dimensions.dart';
import '../../../data/constant/application_constant.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Material(
          color: appController.appTheme.screenBackground,
          child: Container(
            margin: EdgeInsets.only(top: Dimensions.height45 + 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FlutterLogo(size: Dimensions.radius15),
                    SizedBox(width: Dimensions.width10 - 5),
                    Text(
                      'Welcome to ${Application.applicationName}',
                      style: TextStyle(
                        fontSize: Dimensions.font14,
                        fontWeight: FontWeight.w400,
                        color: appController.appTheme.textColor,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
