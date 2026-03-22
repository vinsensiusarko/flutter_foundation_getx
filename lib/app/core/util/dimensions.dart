/*
 * Created by Vinsensius Arko on 08/12/2024, 05:38
 * vinsensiusarka@gmail.com
 * Last modified 05/12/2024, 18:16
 * Copyright (c) 2024.
 * All rights reserved.
 */

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dimensions {
  static double get screenHeight => 1.sh;
  static double get screenWidth => 1.sw;

  // === COMPONENT SIZES ===
  // Berdasarkan hitungan awalmu (683.4 / 2.13 = 320)
  static double get pageView => 320.h;
  static double get pageViewContainer => 220.h;
  static double get pageViewTextContainer => 120.h;

  // === DYNAMIC HEIGHT ===
  static double get height10 => 10.h;
  static double get height15 => 15.h;
  static double get height20 => 20.h;
  static double get height30 => 30.h;
  static double get height45 => 45.h;

  // === DYNAMIC WIDTH ===
  // Catatan: di kode asli kamu pakai screenHeight buat lebar,
  // tapi idealnya kita ubah ke .w biar responsif ke lebar layar beneran
  static double get width10 => 10.w;
  static double get width15 => 15.w;
  static double get width20 => 20.w;
  static double get width30 => 30.w;
  static double get width45 => 45.w;

  // === FONT SIZE ===
  static double get font10 => 10.sp;
  static double get font12 => 12.sp;
  static double get font14 => 14.sp;
  static double get font15 => 15.sp;
  static double get font16 => 16.sp;
  static double get font20 => 20.sp;
  static double get font26 => 26.sp;
  static double get font30 => 30.sp;

  // === RADIUS ===
  static double get radius10 => 10.r;
  static double get radius12 => 12.r;
  static double get radius15 => 15.r;
  static double get radius20 => 20.r;
  static double get radius30 => 30.r;

  // === ICON SIZE ===
  // sp atau .r aman untuk icon biar proporsional
  static double get iconSize12 => 12.sp;
  static double get iconSize16 => 16.sp;
  static double get iconSize20 => 20.sp;
  static double get iconSize24 => 24.sp;

  // === LIST VIEW SIZE ===
  // (411.4 / 3.42 = 120), (411.4 / 4.11 = 100)
  static double get listViewImgSize => 120.w;
  static double get listViewTextContSize => 100.w;

  // === POPULAR FOOD ===
  // (683.4 / 1.95 = 350)
  static double get popularFoodImgSize => 350.h;

  // === BOTTOM BAR ===
  // (683.4 / 5.69 = 120)
  static double get bottomHeightBar => 120.h;

  // === SCREEN DIMENSIONS ===
  // (683.4 / 5.38 = ~127)
  static double get loginImg => 127.h;
  // (683.4 / 3.38 = ~202)
  static double get splashImg => 202.h;
}
