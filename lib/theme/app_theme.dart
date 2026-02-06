/*
 * Created by Vinsensius Arko on 08/12/2024, 05:38
 * vinsensiusarka@gmail.com
 * Last modified 06/12/2024, 20:58
 * Copyright (c) 2024.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_foundation_getx/style/color.dart';

enum ThemeType {
  light,
  dark,
}

class AppTheme {
  static ThemeType defaultTheme = ThemeType.light;

  /// Theme Colors
  bool isDark;
  Color activeIcon;
  Color activeText;
  Color appBarBackground;
  Color screenBackground;
  Color bottomNavigationBarBackground;
  Color textColor;
  Color primary;
  Color progressIndicator;

  /// Default constructor
  AppTheme({
    required this.isDark,
    required this.activeIcon,
    required this.activeText,
    required this.appBarBackground,
    required this.screenBackground,
    required this.bottomNavigationBarBackground,
    required this.textColor,
    required this.primary,
    required this.progressIndicator,
  });

  /// fromType factory constructor
  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.light:
        return AppTheme(
          isDark: false,
          activeIcon: AppColors.mainColor,
          activeText: AppColors.mainColor,
          appBarBackground: AppColors.colorWhite,
          screenBackground: AppColors.colorWhite,
          bottomNavigationBarBackground: AppColors.colorWhite,
          textColor: AppColors.colorBlack,
          primary: AppColors.mainColor,
          progressIndicator: AppColors.mainColor,
        );

      case ThemeType.dark:
        return AppTheme(
          isDark: true,
          activeIcon: AppColors.colorWhite,
          activeText: AppColors.colorWhite,
          appBarBackground: AppColors.colorDark,
          screenBackground: AppColors.colorDark,
          bottomNavigationBarBackground: AppColors.colorDark,
          textColor: AppColors.colorWhite,
          primary: AppColors.mainColorLight,
          progressIndicator: AppColors.colorWhite,
        );
    }
  }

  ThemeData get themeData {
    var t = ThemeData(
      useMaterial3: true,
      fontFamily: 'Roboto',
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBackground,
        titleTextStyle: TextStyle(color: textColor),
        iconTheme: IconThemeData(
          color: activeIcon,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        ),
      ),
      scaffoldBackgroundColor: screenBackground,
      listTileTheme: ListTileThemeData(
        iconColor: activeIcon,
        titleTextStyle: TextStyle(color: textColor),
        subtitleTextStyle: TextStyle(color: textColor)
      ),
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: progressIndicator
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent
      ),
    );

    return t.copyWith(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: Colors.transparent,
        cursorColor: primary,
      ),
      buttonTheme: ButtonThemeData(buttonColor: primary),
    );
  }
}