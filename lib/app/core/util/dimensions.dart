/*
 * Created by Vinsensius Arko on 08/12/2024, 05:38
 * vinsensiusarka@gmail.com
 * Last modified 05/12/2024, 18:16
 * Copyright (c) 2024.
 * All rights reserved.
 */

import 'package:get/get.dart';

class Dimensions {
  static double _screenHeight = 0;
  static double _screenWidth = 0;

  /// Method to initialize screen dimensions
  static void init() {
    _screenHeight = Get.height;
    _screenWidth = Get.width;
  }

  static double get screenHeight => _screenHeight;
  static double get screenWidth => _screenWidth;

  static double get pageView => screenHeight / 2.135714285714286;
  static double get pageViewContainer => screenHeight / 3.106493506493506;
  static double get pageViewTextContainer => screenHeight / 5.695238095238095;

  // dynamic height padding and margin
  static double get height10 => screenHeight / 68.34285714285714;
  static double get height15 => screenHeight / 45.56190476190476;
  static double get height20 => screenHeight / 34.17142857142857;
  static double get height30 => screenHeight / 22.78095238095238;
  static double get height45 => screenHeight / 15.18730158730159;

  // dynamic width padding and margin
  static double get width10 => screenHeight / 68.34285714285714;
  static double get width15 => screenHeight / 45.56190476190476;
  static double get width20 => screenHeight / 34.17142857142857;
  static double get width30 => screenHeight / 22.78095238095238;
  static double get width45 => screenHeight / 15.18730158730159;

  // font size
  static double get font10 => screenHeight / 68.34285714285714;
  static double get font12 => screenHeight / 62.71428571428571;
  static double get font14 => screenHeight / 53.75510204081632;
  static double get font15 => screenHeight / 45.56190476190476;
  static double get font16 => screenHeight / 42.71428571428571;
  static double get font20 => screenHeight / 34.17142857142857;
  static double get font26 => screenHeight / 26.28571428571428;
  static double get font30 => screenHeight / 22.78095238095238;

  // radius
  static double get radius10 => screenHeight / 68.34285714285714;
  static double get radius12 => screenHeight / 62.71428571428571;
  static double get radius15 => screenHeight / 45.56190476190476;
  static double get radius20 => screenHeight / 34.17142857142857;
  static double get radius30 => screenHeight / 22.78095238095238;

  // icon size
  static double get iconSize12 => screenHeight / 62.71428571428571;
  static double get iconSize16 => screenHeight / 42.71428571428571;
  static double get iconSize20 => screenHeight / 34.17142857142857;
  static double get iconSize24 => screenHeight / 28.47619047619048;

  // list view size
  static double get listViewImgSize => screenWidth / 3.428571428571428;
  static double get listViewTextContSize => screenWidth / 4.114285714285714;

  // popular food
  static double get popularFoodImgSize => screenHeight / 1.95265306122449;

  // bottom height
  static double get bottomHeightBar => screenHeight / 5.695238095238095;

  // login screen dimensions
  static double get loginImg => screenHeight / 5.38;

  // splash screen dimensions
  static double get splashImg => screenHeight / 3.38;
}
