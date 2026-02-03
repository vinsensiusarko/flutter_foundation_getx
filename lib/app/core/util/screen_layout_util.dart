/*
 * Created by Vinsensius Arko on 03/02/2026, 22:43
 * vinsensiusarka@gmail.com
 * Last modified 03/02/2026, 22:43
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter/material.dart';

class ScreenLayout {
  /// Breakpoint standar untuk mobile ke tablet
  static const double mobileBreakpoint = 525;
  static const double tabletBreakpoint = 1100;

  /// Cek apakah perangkat adalah Mobile
  static bool isMobileDevice(BuildContext context) => MediaQuery.of(context).size.width <= mobileBreakpoint;

  /// Cek apakah perangkat adalah Tablet (di antara mobile dan desktop)
  static bool isTabletDevice(BuildContext context) => MediaQuery.of(context).size.width > mobileBreakpoint && MediaQuery.of(context).size.width <= tabletBreakpoint;

  /// Cek Portrait
  static bool isPortrait(BuildContext context) => MediaQuery.of(context).orientation == Orientation.portrait;

  /// Cek Landscape
  static bool isLandscape(BuildContext context) => MediaQuery.of(context).orientation == Orientation.landscape;

  /// Gabungan: Tablet dalam mode Portrait
  static bool isTabletPortrait(BuildContext context) => isTabletDevice(context) && isPortrait(context);

  /// Gabungan: Tablet dalam mode Landscape
  static bool isTabletLandscape(BuildContext context) => isTabletDevice(context) && isLandscape(context);

  /// Cek Desktop
  static bool isDesktopDevice(BuildContext context) => MediaQuery.of(context).size.width > tabletBreakpoint;
}

/// Helper Extension agar bisa dipanggil via context
/// Contoh: context.isMobile
extension ScreenContext on BuildContext {
  bool get mobileScreen => ScreenLayout.isMobileDevice(this);
  bool get tabletScreen => ScreenLayout.isTabletDevice(this);
  bool get desktopScreen => ScreenLayout.isDesktopDevice(this);

  bool get tabletPortraitScreen => ScreenLayout.isPortrait(this);
  bool get tabletLandscapeScreen => ScreenLayout.isLandscape(this);

  // Helper untuk mendapatkan ukuran layar langsung
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
}