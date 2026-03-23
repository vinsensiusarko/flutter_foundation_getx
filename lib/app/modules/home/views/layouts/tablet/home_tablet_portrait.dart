/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 04/02/2026, 00:15
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter_foundation_getx/app/core/util/app_config.dart';
import 'package:flutter_foundation_getx/app/core/util/dimensions.dart';
import 'package:flutter_foundation_getx/app/modules/home/controllers/home_controller.dart';

class HomeTabletPortrait extends StatelessWidget {
  final HomeController controller;
  const HomeTabletPortrait({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: Dimensions.radius30),
            SizedBox(width: Dimensions.width10),
            Text(
              '${controller.title}, Tablet Portrait Mode',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Dimensions.font20,
                fontWeight: FontWeight.w400,
                color: appController.appTheme.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

