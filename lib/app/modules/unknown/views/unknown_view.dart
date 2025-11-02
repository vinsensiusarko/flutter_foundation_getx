import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/unknown_controller.dart';

class UnknownView extends GetView<UnknownController> {
  const UnknownView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UnknownView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UnknownView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
