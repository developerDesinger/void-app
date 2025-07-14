import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:voidapp/presentation/settings/views/settings_view.dart';
import 'package:voidapp/presentation/statistics/views/statistics_view.dart';
import 'package:voidapp/presentation/void/views/void_view.dart';

class MainController extends GetxController {
  int currentIndex = 0;


  final List<Widget> pages = [
    const StatisticsView(),
    const VoidView(),
    const SettingsView(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  setPageIndex(int index) {
    currentIndex = index;
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
