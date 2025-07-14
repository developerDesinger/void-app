import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:voidapp/app/config/app_colors.dart';

import '../controllers/void_controller.dart';

class VoidView extends GetView<VoidController> {
  const VoidView({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.primary,
       body: const Center(
        child: Text(
          'Void',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
