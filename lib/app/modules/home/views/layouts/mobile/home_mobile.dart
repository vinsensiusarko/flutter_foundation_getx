/*
 * Created by Vinsensius Arko on 03/02/2026, 23:14
 * vinsensiusarka@gmail.com
 * Last modified 03/02/2026, 23:14
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter_foundation_getx/app/core/util/app_config.dart';
import 'package:flutter_foundation_getx/app/core/util/dimensions.dart';
import 'package:flutter_foundation_getx/app/data/constant/application_constant.dart';
import 'package:flutter_foundation_getx/app/modules/home/controllers/home_controller.dart';

class HomeMobile extends StatelessWidget {
  final HomeController controller;
  const HomeMobile({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: appController.appTheme.screenBackground,
      child: Container(
        margin: EdgeInsets.only(top: Dimensions.height45 + 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${controller.title}, Mobile Mode',
                    style: TextStyle(
                      fontSize: Dimensions.font14,
                      fontWeight: FontWeight.w400,
                      color: appController.appTheme.textColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
