import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:voidapp/app/shared_widgets/my_text.dart';
import '../../../app/config/app_colors.dart';
import '../../../app/utils/utils.dart';
import '../controllers/main_controller.dart';


class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MainController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black, // Optional: to match primary
          bottomNavigationBar: Container(
            color: AppColors.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  controller: controller,
                  index: 0,
                  iconSelected: Utils.getIconPath("insights"),
                  iconUnselected: Utils.getIconPath("insights-normal"),
                  label: "INSIGHTS",
                ),
                _buildNavItem(
                  controller: controller,
                  index: 1,
                  iconSelected: Utils.getIconPath("void"),
                  iconUnselected: Utils.getIconPath("void-normal"),
                  label: "THE VOID",
                ),
                _buildNavItem(
                  controller: controller,
                  index: 2,
                  iconSelected: Utils.getIconPath("setting"),
                  iconUnselected: Utils.getIconPath("setting-normal"),
                  label: "SETTINGS",
                ),
              ],
            ),
          ).paddingOnly(bottom:2.5.h),
          body: IndexedStack(
            index: controller.currentIndex,
            children: controller.pages,
          ),
        );
      },
    );
  }

  Widget _buildNavItem({
    required MainController controller,
    required int index,
    required String iconSelected,
    required String iconUnselected,
    required String label,
  }) {
    final bool isSelected = controller.currentIndex == index;

    return GestureDetector(
      onTap: () {
        controller.setPageIndex(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            isSelected ? iconSelected : iconUnselected,
            scale: 3,
          ),
           SizedBox(height: 0.3.h),
          isSelected
              ? ShaderMask(
            shaderCallback: (bounds) => AppColors.textGradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: MyText(
              title: label,
              size: 15.sp,
              clr: AppColors.white,
              weight: FontWeight.w600,
            ),
          )
              :  MyText(
            title: label,
            size: 15.sp,
            clr: AppColors.grey6B,
            weight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
