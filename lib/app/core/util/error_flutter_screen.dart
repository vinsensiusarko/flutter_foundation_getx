/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 22/03/2026, 06:37
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter/material.dart';

import '../../../style/color.dart';

void flutterErrorScreen() {
  ErrorWidget.builder = (FlutterErrorDetails details) => ErrorFlutterScreen(errorDetails: details);
}

class ErrorFlutterScreen extends StatelessWidget {
  final FlutterErrorDetails errorDetails;
  const ErrorFlutterScreen({super.key, required this.errorDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          clipBehavior: Clip.none,
          padding: EdgeInsets.symmetric(
            horizontal: 10
          ),
          physics: const ClampingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()
          ),
          children: [
            SizedBox(height: 45),
            CircleAvatar(
              radius: 100,
              backgroundColor: AppColors.mainColor.withValues(alpha: 0.8),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: const AssetImage('assets/images/hehe-boi.jpg'),
              ),
            ),
            SizedBox(height: 5),
            Text(
              '🐊 🦅 Error Maning Boss 🐧 🦖',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                errorDetails.exceptionAsString(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


