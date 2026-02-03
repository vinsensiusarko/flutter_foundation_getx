import 'package:flutter/material.dart';
import 'package:flutter_foundation_getx/app/widget/dialog/custom_alert_dialog.dart';

import 'package:get/get.dart';

import '../../../../style/color.dart';
import '../../../core/util/app_config.dart';
import '../../../core/util/dimensions.dart';
import '../../../widget/custom_icon_card.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              tileColor: Colors.transparent,
              leading: CustomIconCard(
                height: Dimensions.height30,
                width: Dimensions.width30,
                icon: appController.isDarkTheme.value == false ? Icons.light_mode : Icons.dark_mode,
                iconSize: Dimensions.radius20,
                iconColor: AppColors.mainColor,
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                'Theme',
                style: TextStyle(
                  color: appController.appTheme.textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: Dimensions.font16,
                ),
              ),
              trailing: Switch(
                activeTrackColor: AppColors.colorWhite,
                activeThumbColor: AppColors.mainColor,
                value: appController.isDarkTheme.value!,
                onChanged: (themeValue) {
                  if (themeValue != appController.isDarkTheme.value) {
                    customAlertDialog(
                      context: context,
                      title: 'Theme',
                      content: 'Are you sure you want to change theme?',
                      leftText: 'Cancel',
                      leftButton: () {
                        Get.back();
                      },
                      rightText: 'Change',
                      rightButtonColor: AppColors.mainColor,
                      rightButton: () {
                        controller.switchTheme(themeValue);
                      },
                    );
                  }
                },
              ),
            ),
            ListTile(
              onTap: () {
                customAlertDialog(
                  context: context,
                  title: 'Logout',
                  content: 'Are you sure you want to logout?',
                  leftText: 'Cancel',
                  leftButton: () {
                    Get.back();
                  },
                  rightText: 'Logout',
                  rightButtonColor: AppColors.colorRedAccent,
                  rightButton: () {
                    controller.logout();
                  },
                );
              },
              tileColor: Colors.transparent,
              leading: CustomIconCard(
                height: Dimensions.height30,
                width: Dimensions.width30,
                icon: Icons.logout,
                iconSize: Dimensions.radius20,
                iconColor: AppColors.colorRed,
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  color: appController.appTheme.textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: Dimensions.font16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
