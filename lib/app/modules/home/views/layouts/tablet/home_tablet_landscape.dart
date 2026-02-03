/*
 * Created by Vinsensius Arko on 03/02/2026, 23:21
 * vinsensiusarka@gmail.com
 * Last modified 03/02/2026, 23:21
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter_foundation_getx/app/core/util/app_config.dart';
import 'package:flutter_foundation_getx/app/core/util/dimensions.dart';
import 'package:flutter_foundation_getx/app/modules/home/controllers/home_controller.dart';

class HomeTabletLandscape extends StatelessWidget {
  final HomeController controller;
  const HomeTabletLandscape({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FlutterLogo(size: Dimensions.radius30 + 70),
          SizedBox(height: Dimensions.height20),
          Text(
            '${controller.title}, Tablet Landscape Mode',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Dimensions.font20,
              fontWeight: FontWeight.w400,
              color: appController.appTheme.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
