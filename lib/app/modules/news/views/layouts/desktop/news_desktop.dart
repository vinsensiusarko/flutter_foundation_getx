/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 24/03/2026, 00:04
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter/material.dart';

import '../../../controllers/news_controller.dart';

class NewsDesktop extends StatelessWidget {
  final NewsController controller;
  const NewsDesktop({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          controller.title
        ),
      ),
    );
  }
}