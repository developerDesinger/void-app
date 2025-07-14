import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:voidapp/app/config/app_colors.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: AppColors.primary,
      body: const Center(
        child: Text(
          'Settings',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
