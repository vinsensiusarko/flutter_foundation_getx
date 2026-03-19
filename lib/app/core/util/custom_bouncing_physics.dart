/*
 * Created by Vinsensius Arko on 17/03/2026, 00:12
 * vinsensiusarka@gmail.com
 * Last modified 17/03/2026, 00:12
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter/material.dart';

class CustomBouncingPhysics extends BouncingScrollPhysics {
  const CustomBouncingPhysics({super.parent});

  @override
  CustomBouncingPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomBouncingPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    if (value < position.pixels && position.pixels <= position.minScrollExtent) {
      return value - position.pixels;
    }

    if (position.maxScrollExtent <= position.pixels && position.pixels < value) {
      return value - position.pixels;
    }
    return 0.0;
  }
}