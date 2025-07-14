
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voidapp/app/config/app_colors.dart';
import 'package:voidapp/app/shared_widgets/custom_assetimage.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primary,
          body: Center(
            child: FadeTransition(
              opacity: controller.fadeAnim,
              child: const CustomAssetIcon(path: 'logo'),
            ),
          ),
        );
      },
    );
  }
}
