import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:voidapp/app/config/app_colors.dart';
import 'package:voidapp/app/shared_widgets/my_text.dart';

class GradientCommitButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;


  const GradientCommitButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const double borderWidth = .5;
    const double borderRadius = 140.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90.w,
        height: 7.h,
        decoration: BoxDecoration(
          gradient: AppColors.buttonBorderGradient,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: AppColors.buttonBorderGradient.colors.first.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: .01,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        padding: const EdgeInsets.all(borderWidth),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF101010),
            borderRadius: BorderRadius.circular(borderRadius - borderWidth),
            
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
               const SizedBox(),
              MyText(
                title: title,
                clr: Colors.white,
                size: 16.sp,
                weight: FontWeight.w600,
              ),
              
              Container(
                width: 6.h,
                height: 6.h,
                padding: const EdgeInsets.all(borderWidth),
                decoration:  BoxDecoration(
                  // gradient: AppColors.buttonBorderGradient,
                  shape: BoxShape.circle,
                  boxShadow: [
            BoxShadow(
              color: AppColors.buttonBorderGradient.colors.first.withOpacity(0.1),
              blurRadius: 2,
              spreadRadius: .2,
              offset: const Offset(0, 0),
            ),
          ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(.05),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white.withOpacity(.3),
                      width: .5,
                    )
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
