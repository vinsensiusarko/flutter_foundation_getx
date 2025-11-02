import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../style/color.dart';
import '../../../core/util/app_config.dart';
import '../../../core/util/dimensions.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          body: controller.screenList[controller.currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 - 4),
                topRight: Radius.circular(Dimensions.radius20 - 4),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 - 4),
                topRight: Radius.circular(Dimensions.radius20 - 4),
              ),
              child: Theme(
                data: ThemeData(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                ),
                child: BottomNavigationBar(
                  backgroundColor: appController.appTheme.screenBackground,
                  selectedFontSize: Dimensions.font12,
                  unselectedFontSize: Dimensions.font12,
                  selectedItemColor: appController.appTheme.activeText,
                  unselectedItemColor: appController.isDarkTheme.value == false ? AppColors.colorGrey : AppColors.colorGrey.shade300,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: controller.currentIndex,
                  onTap: (index) {
                    controller.onTapIndex(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                        padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: Dimensions.width10
                        ),
                        decoration: BoxDecoration(
                          color: controller.currentIndex == 0 ? AppColors.mainColorLight.withValues(alpha: 0.5) : Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20)),
                        ),
                        child: Icon(
                          controller.currentIndex == 0 ? Icons.dashboard_customize : Icons.dashboard_customize_outlined,
                          color: controller.currentIndex == 0 ? appController.appTheme.activeIcon : null,
                        ),
                      ),
                      label: 'Home',
                      tooltip: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                        padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: Dimensions.width10
                        ),
                        decoration: BoxDecoration(
                          color: controller.currentIndex == 1 ? AppColors.mainColorLight.withValues(alpha: 0.5) : Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20)),
                        ),
                        child: Icon(
                          controller.currentIndex == 1 ? Icons.newspaper : Icons.newspaper_outlined,
                          color: controller.currentIndex == 1 ? appController.appTheme.activeIcon : null,
                        ),
                      ),
                      label: 'News',
                      tooltip: 'News',
                    ),
                    BottomNavigationBarItem(
                      icon: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                        padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: Dimensions.width10
                        ),
                        decoration: BoxDecoration(
                          color: controller.currentIndex == 2 ? AppColors.mainColorLight.withValues(alpha: 0.5) : Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20)),
                        ),
                        child: Icon(
                          controller.currentIndex == 2 ? Icons.person : Icons.person_outline,
                          color: controller.currentIndex == 2 ? appController.appTheme.activeIcon : null,
                        )
                      ),
                      label: 'Setting',
                      tooltip: 'Setting',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
