import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voidapp/app/routes/app_pages.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnim;

  @override
  void onInit() {
    super.onInit();
    _initAnimation();
    _startAnimation();
  }

  void _initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration:  Duration(milliseconds: 900),
    );
    fadeAnim = CurvedAnimation(parent: animationController, curve: Curves.easeIn);
  }

  void _startAnimation() {
    animationController.forward();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigateToNextScreen();
      }
    });
  }

  void _navigateToNextScreen() {
    Future.delayed( Duration(milliseconds: 1200), () {
      Get.offAllNamed(Routes.LOCKED_APP);
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
