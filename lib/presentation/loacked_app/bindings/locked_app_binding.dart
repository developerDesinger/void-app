import 'package:get/get.dart';

import '../controllers/locked_app_controller.dart';

class LockedAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LockedAppController>(
      () => LockedAppController(),
    );
  }
}
