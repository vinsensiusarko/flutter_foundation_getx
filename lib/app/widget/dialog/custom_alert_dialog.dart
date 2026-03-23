/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 05/08/2025, 14:39
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foundation_getx/app/core/util/app_config.dart';
import 'package:flutter_foundation_getx/app/core/util/dimensions.dart';

void customAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String leftText,
  required String rightText,
  required Function() leftButton,
  required Function() rightButton,
  Color? rightButtonColor,
}) {
  showCupertinoDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        backgroundColor: appController.appTheme.screenBackground,
        title: Text(
          title,
          style: TextStyle(
            color: appController.appTheme.textColor,
            fontWeight: FontWeight.w400,
            fontSize: Dimensions.font14,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: Dimensions.loginImg - 100,
            ),
            SizedBox(height: Dimensions.height10),
            Text(
              content,
              style: TextStyle(
                color: appController.appTheme.textColor,
                fontWeight: FontWeight.w400,
                fontSize: Dimensions.font12,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: leftButton,
            child: Text(
              leftText,
              style: TextStyle(
                color: appController.appTheme.textColor,
                fontWeight: FontWeight.w400,
                fontSize: Dimensions.font14,
              )
            )
          ),
          TextButton(
            onPressed: rightButton,
            child: Text(
              rightText,
              style: TextStyle(
                color: rightButtonColor ?? appController.appTheme.textColor,
                fontWeight: FontWeight.w400,
                fontSize: Dimensions.font14,
              ),
            ),
          ),
        ],
      );
    }
  );
}