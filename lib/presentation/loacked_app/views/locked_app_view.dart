
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:voidapp/app/config/app_colors.dart';
import 'package:voidapp/app/extensions/extensions.dart';
import 'package:voidapp/app/routes/app_pages.dart';
import 'package:voidapp/app/shared_widgets/custom_assetimage.dart';
import 'package:voidapp/app/shared_widgets/my_text.dart';
import 'package:voidapp/presentation/loacked_app/views/widgets/primary_gradient_button.dart';
import '../controllers/locked_app_controller.dart';


class LockedAppView extends GetView<LockedAppController> {
  const LockedAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return  LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.primary,
                  ],
                  stops: const [0.0, 0.05],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: const CustomAssetIcon(path: 'topbar', scale: 3),
            ),
          ),
          
           Positioned(
            left: 0,
            right: 0,
            top: 17.h,
            child: const CustomAssetIcon(path: "black_overlay", scale: 2),
          ),
           Positioned(
            left: 0,
            right: 0,
            top: 25.h,
            child: const CustomAssetIcon(path: "light_shape", scale: 3.5),
          ),
          Positioned(
            top: 30.h,
            left: 0,
            right: 0,
            child: const _LockedAppHeader(),
          ),
          Positioned(
            bottom: 2.h,
            left: 0,
            right: 0,
            child: const _LockedAppBottomContent(),
          ),
        ],
      ),
    );
  }
}

class _LockedAppHeader extends StatelessWidget {
  const _LockedAppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyText(
          title: 'YOU’RE DEEP IN\nTHE',
          clr: AppColors.secondary,
          size: 16.sp,
          weight: FontWeight.w600,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 1.h),
        const CustomAssetIcon(path: 'logo'),
      ],
    );
  }
}

class _LockedAppBottomContent extends StatelessWidget {
  const _LockedAppBottomContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyText(
          title: 'ACCESS TO',
          clr: AppColors.white,
          size: 14.sp,
          weight: FontWeight.w600,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 1.h),
        const _GoogleIconBox(),
        SizedBox(height: 1.h),
        const _SuspendedRow(),
        SizedBox(height: 3.h),
        GradientCommitButton(
          title: "I’M COMMITTED",
          onTap: () {
            Get.toNamed(Routes.MAIN);
          },
        ),
        3.h.height,
      ],
    );
  }
}

class _GoogleIconBox extends StatelessWidget {
  const _GoogleIconBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowRed.withOpacity(.4),
            blurRadius: 5,
            spreadRadius: .1,
          ),
        ],
      ),
      child: const Center(
        child: CustomAssetIcon(path: 'google', scale: 1),
      ),
    );
  }
}

class _SuspendedRow extends StatelessWidget {
  const _SuspendedRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText(title: '[', clr: AppColors.tertiary, size: 14.sp, weight: FontWeight.w500),
        SizedBox(width: 2.w),
        MyText(title: 'IS SUSPENDED', clr: AppColors.white, size: 14.sp, weight: FontWeight.w700),
        SizedBox(width: 2.w),
        MyText(title: ']', clr: AppColors.tertiary, size: 14.sp, weight: FontWeight.w500),
      ],
    );
  }
}