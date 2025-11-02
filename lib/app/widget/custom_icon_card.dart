/*
 * Created by Vinsensius Arko on 17/03/2025, 12:51
 * vinsensiusarka@gmail.com
 * Last modified 03/03/2025, 13:32
 * Copyright (c) 2025.
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
