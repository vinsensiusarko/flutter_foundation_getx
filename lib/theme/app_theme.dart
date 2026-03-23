/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 22/03/2026, 14:11
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_foundation_getx/app/core/util/dimensions.dart';
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
  Color bottomAppBarBackground;
  Color bottomAppBarIcon;
  Color bottomAppBarText;
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
    required this.bottomAppBarBackground,
    required this.bottomAppBarIcon,
    required this.bottomAppBarText,
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
          bottomAppBarBackground: AppColors.colorWhite,
          bottomAppBarIcon: Colors.grey,
          bottomAppBarText: Colors.grey,
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
          bottomAppBarBackground: AppColors.colorDark,
          bottomAppBarIcon: Colors.white54,
          bottomAppBarText: Colors.white54,
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
        titleTextStyle: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w400,
          fontSize: Dimensions.font20,
        ),
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