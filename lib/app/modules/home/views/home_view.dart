import 'package:flutter/material.dart';
import 'package:flutter_foundation_getx/app/core/util/screen_layout_util.dart';
import 'package:flutter_foundation_getx/app/modules/home/views/layouts/desktop/home_desktop.dart';
import 'package:flutter_foundation_getx/app/modules/home/views/layouts/mobile/home_mobile.dart';
import 'package:flutter_foundation_getx/app/modules/home/views/layouts/tablet/home_tablet_landscape.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'layouts/tablet/home_tablet_portrait.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        if (context.desktopScreen) {
          return HomeDesktop(controller: controller);
        } else if (context.tabletScreen) {
          if (context.tabletPortraitScreen) {
            return HomeTabletPortrait(controller: controller);
          } else {
            return HomeTabletLandscape(controller: controller);
          }
        } else {
          return HomeMobile(controller: controller);
        }
      },
    );
  }
}
