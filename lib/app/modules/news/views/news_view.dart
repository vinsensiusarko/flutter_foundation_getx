/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 24/03/2026, 00:04
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter_foundation_getx/app/modules/news/views/layouts/desktop/news_desktop.dart';
import 'package:flutter_foundation_getx/app/modules/news/views/layouts/mobile/news_mobile.dart';
import 'package:flutter_foundation_getx/app/modules/news/views/layouts/tablet/news_tablet_landscape.dart';
import 'package:flutter_foundation_getx/app/modules/news/views/layouts/tablet/news_tablet_portrait.dart';
import 'package:get/get.dart';

import '../../../core/util/screen_layout_util.dart';
import '../controllers/news_controller.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      builder: (controller) {
        if (context.desktopScreen) {
          return NewsDesktop(controller: controller);
        } else if (context.tabletScreen) {
          if (context.tabletPortraitScreen) {
            return NewsTabletPortrait(controller: controller);
          } else {
            return NewsTabletLandscape(controller: controller);
          }
        } else {
          return NewsMobile(controller: controller);
        }
      }
    );
  }
}
