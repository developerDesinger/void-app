import 'package:get/get.dart';

import '../controllers/void_controller.dart';

class VoidBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoidController>(
      () => VoidController(),
    );
  }
}
