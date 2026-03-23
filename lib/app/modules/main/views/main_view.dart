/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 22/03/2026, 21:00
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../style/color.dart';
import '../../../core/util/app_config.dart';
import '../../../core/util/custom_bouncing_physics.dart';
import '../../../core/util/dimensions.dart';
import '../../home/views/home_view.dart';
import '../../news/views/news_view.dart';
import '../../setting/views/setting_view.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              PageView(
                controller: controller.pageController,
                onPageChanged: controller.onSwipePageIndex,
                physics: const CustomBouncingPhysics(),
                children: [
                  const HomeView(),
                  const NewsView(),
                  const SizedBox(),
                  const SettingView(),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: Dimensions.width10,
                  color: Colors.transparent,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: Dimensions.width10,
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
          extendBody: true,
          resizeToAvoidBottomInset: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: Transform.translate(
            offset: const Offset(0, 23.5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: FloatingActionButton.small(
                    heroTag: 'createSomething',
                    tooltip: '',
                    elevation: 4,
                    backgroundColor: AppColors.mainColorLight,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                      side: BorderSide(
                        color: Colors.white,
                        strokeAlign: 1,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    onPressed: () {
                      if (kDebugMode) {
                        print('Create Something Page');
                      }
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: Dimensions.radius15 + 4,
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height15 - 3),
                Text(
                  'Create',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainColorLight,
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius10 - 2),
                topRight: Radius.circular(Dimensions.radius10 - 2),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.only(
                topLeft: Radius.circular(Dimensions.radius10 - 2),
                topRight: Radius.circular(Dimensions.radius10 - 2),
              ),
              child: BottomAppBar(
                height: Dimensions.height45 + 10,
                padding: EdgeInsets.zero,
                elevation: 0,
                color: appController.appTheme.screenBackground,
                shadowColor: Colors.black,
                surfaceTintColor: Colors.white,
                shape: null,
                notchMargin: 0,
                child: SizedBox(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNavItem(
                        controller: controller,
                        icon: controller.currentIndex == 0 ? Icons.dashboard_customize : Icons.dashboard_customize_outlined,
                        label: 'Beranda',
                        index: 0,
                      ),
                      _buildNavItem(
                        controller: controller,
                        icon: controller.currentIndex == 1 ? Icons.inventory_2 : Icons.inventory_2_outlined,
                        label: 'Product',
                        index: 1,
                      ),
                      const SizedBox(width: 50),
                      _buildNavItem(
                        controller: controller,
                        icon: controller.currentIndex == 2 ? Icons.transfer_within_a_station : Icons.transfer_within_a_station_outlined,
                        label: 'Transfer',
                        index: 2,
                      ),
                      _buildNavItem(
                        controller: controller,
                        icon: controller.currentIndex == 3 ? Icons.person : Icons.person_outline,
                        label: 'Profil',
                        index: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  Widget _buildNavItem({required MainController controller, required IconData icon, required String label, required int index}) {
    bool isSelected = controller.currentIndex == index;
    return InkWell(
      onTap: () => controller.onTapIndex(index),
      highlightColor: isSelected ? Colors.transparent : Colors.transparent,
      splashColor: isSelected ? Colors.transparent : Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.height10 - 10,
              horizontal: Dimensions.width10,
            ),
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius12),
              color: isSelected ? AppColors.mainColorLight.withValues(alpha: 0.8) : Colors.transparent,
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : appController.appTheme.bottomAppBarIcon,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? AppColors.mainColorLight : appController.appTheme.bottomAppBarText,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
