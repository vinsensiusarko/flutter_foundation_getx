/*
 * Created by Vinsensius Arko on 24/03/2026, 04:44
 * vinsensiusarka@gmail.com
 * Last modified 19/07/2025, 00:27
 * Copyright (c) 2026.
 * All rights reserved.
 */

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Boi'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Flutter Foundation Getx',
              style: TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controller.login();
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
