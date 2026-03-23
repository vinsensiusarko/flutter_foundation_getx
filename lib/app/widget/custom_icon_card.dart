/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 18/07/2025, 22:37
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter_foundation_getx/app/core/util/dimensions.dart';

class CustomIconCard extends StatelessWidget {
  final IconData? icon;
  final String? image;
  final double iconSize;
  final Color backgroundColor;
  final Color? iconColor;
  final double height;
  final double width;

  const CustomIconCard({
    super.key,
    this.icon,
    this.image,
    required this.height,
    required this.width,
    required this.backgroundColor,
    this.iconColor,
    required this.iconSize
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(Dimensions.radius10),
      ),
      child: Center(
        child: icon != null ? Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ) : image!.startsWith('http') || image!.startsWith('https') ? Image.network(
          image!,
          height: iconSize,
          color: iconColor,
        ) : Image.asset(
          image!,
          height: iconSize,
          color: iconColor,
        )
      ),
    );
  }
}
