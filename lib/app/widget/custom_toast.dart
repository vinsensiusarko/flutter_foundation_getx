/*
 * Created by Vinsensius Arko on 17/03/2025, 12:51
 * vinsensiusarka@gmail.com
 * Last modified 08/03/2025, 13:22
 * Copyright (c) 2025.
 * All rights reserved.
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_foundation_getx/app/core/util/dimensions.dart';
import 'package:flutter_foundation_getx/style/color.dart';
import 'package:fluttertoast/fluttertoast.dart';

Timer? toastTimer;

void showToast(BuildContext context, {required String message, bool? isError, Widget? icon}) {
  int maxLength = 34;
  String truncatedMessage = message.length > maxLength ? "${message.substring(0, maxLength)}..." : message;
  if (toastTimer?.isActive ?? false) {
    return;
  }
  toastTimer = Timer(const Duration(seconds: 3), () {
    toastTimer = null;
  });

  FToast fToast = FToast();
  fToast.init(context);

  Widget toast = Container(
    padding: EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 24
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: isError == true ? AppColors.colorRed : isError == false ? AppColors.colorGreen : AppColors.colorBlack.withValues(alpha: 0.8),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (icon != null) ...[
          icon,
          SizedBox(width: 12),
        ],
        if (icon == null && isError == false) ...[
          Icon(
            Icons.check,
            color: AppColors.colorWhite,
          ),
          SizedBox(width: 12),
        ],
        if (icon == null && isError == true) ...[
          Icon(
            Icons.close,
            color: AppColors.colorWhite,
          ),
          SizedBox(width: 12),
        ],
        Text(
          truncatedMessage,
          style: TextStyle(
            fontSize: Dimensions.font14,
            color: AppColors.colorWhite
          ),
        ),
      ],
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: Duration(seconds: 3),
  );
}
