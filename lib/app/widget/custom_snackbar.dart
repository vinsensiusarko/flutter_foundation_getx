/*
 * Created by Vinsensius Arko on 08/12/2024, 05:38
 * vinsensiusarka@gmail.com
 * Last modified 06/12/2024, 20:58
 * Copyright (c) 2024.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter_foundation_getx/app/core/util/dimensions.dart';
import 'package:flutter_foundation_getx/style/color.dart';
import 'package:get/get.dart';

import 'custom_icon_card.dart';

void showCustomSnackBar(String message, {bool isError = true, String title = "Gagal"}) {
  if (!Get.isSnackbarOpen) {
    Get.snackbar(
      title,
      message,
      titleText: Text(
        title,
        style: TextStyle(
          color: AppColors.colorWhite,
          fontWeight: FontWeight.w400,
          fontSize: Dimensions.font15
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          color: AppColors.colorWhite,
          fontWeight: FontWeight.w400,
          fontSize: Dimensions.font12
        ),
      ),
      margin: EdgeInsets.all(Dimensions.radius10 - 2),
      backgroundColor: isError ? AppColors.colorRedAccent : AppColors.colorGreen,
      colorText: AppColors.colorWhite,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      borderRadius: Dimensions.radius10,
      duration: const Duration(seconds: 3),
      isDismissible: true,
      dismissDirection: DismissDirection.up,
      mainButton: TextButton(
        onPressed: () {
          Get.back();
        },
        child: CustomIconCard(
          height: Dimensions.height30,
          width: Dimensions.width30,
          icon: Icons.close,
          iconSize: Dimensions.radius20,
          iconColor: AppColors.colorRed,
          backgroundColor: AppColors.colorWhite,
        ),
      )
    );
  }
}