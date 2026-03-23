/*
 * Created by Vinsensius Arko on 08/12/2024, 05:38
 * vinsensiusarka@gmail.com
 * Last modified 06/12/2024, 20:58
 * Copyright (c) 2024.
 * All rights reserved.
 */

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/util/dimensions.dart';

SnackbarController? controller;

Future<void> showCustomSnackBar({String title = 'Gagal', bool isError = true, required String message, String? messageWithButton, Function? onTap}) async {
  Get.closeAllSnackbars();
  controller = Get.showSnackbar(
    GetSnackBar(
      boxShadows: [
        if (isError)...[
          BoxShadow(
            color: Color(0xFFE5A5A5).withValues(alpha: 0.05),
            blurRadius: 6,
            spreadRadius: 4,
            offset: const Offset(2, 2),
          ),
        ] else...[
          BoxShadow(
            color: Color(0xFFA5E5B3).withAlpha(13),
            blurRadius: 6,
            spreadRadius: 4,
            offset: const Offset(2, 2)
          ),
        ]
      ],
      titleText: ListTile(
        contentPadding: EdgeInsets.zero,
        titleAlignment: ListTileTitleAlignment.top,
        minTileHeight: 0,
        minVerticalPadding: 0,
        leading: Builder(
          builder: (context) {
            if (isError) {
              return Icon(
                Icons.error,
                color: Colors.red,
                size: Dimensions.radius20,
              );
            } else {
              return Icon(
                Icons.check_circle,
                color: Colors.green,
                size: Dimensions.radius20,
              );
            }
          }
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Color(0xFF1F1F1F),
            fontSize: Dimensions.font16,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text.rich(
            TextSpan(
              style: TextStyle(
                color: Color(0xFF1F1F1F),
                fontSize: Dimensions.font14,
              ),
              children: [
                TextSpan(text: '$message '),
                TextSpan(
                  text: messageWithButton ?? '',
                  style: TextStyle(
                    color: isError ? Color(0xFFFD4939) : Color(0xFF008172),
                    fontSize: Dimensions.font14,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {
                    if (onTap != null) {
                      onTap();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        trailing: TextButton(
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width10 - 9),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {
            Future.delayed(Duration.zero).then((value) {
              if (controller != null) {
                controller?.close(withAnimations: false);
              }
            });
          },
          child: Icon(
            Icons.close,
            color: Color(0xFF1F1F1F),
            size: Dimensions.radius15 + 2
          ),
        ),
      ),
      messageText: const SizedBox(),
      margin: EdgeInsets.only(top: Dimensions.height20 - 6),
      borderRadius: Dimensions.radius12,
      backgroundColor: isError ? Color(0xFFFFF5F4) : Color(0xFFF1FFF4),
      borderColor: isError ? Color(0xFFFFBFB9) : Color(0xFFA5E5B3),
      snackPosition: SnackPosition.TOP,
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.height10 + 2,
        horizontal: Dimensions.width10 + 3,
      ),
      maxWidth: Dimensions.width45 * 8.6,
      duration: const Duration(milliseconds: 3000),
    ),
  );
}