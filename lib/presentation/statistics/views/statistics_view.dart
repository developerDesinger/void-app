import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:voidapp/app/extensions/extensions.dart';
import 'package:voidapp/app/shared_widgets/gradient_text.dart';
import 'package:voidapp/app/shared_widgets/my_text.dart';
import '../../../app/config/app_colors.dart';
import '../../../app/shared_widgets/custom_assetimage.dart';
import '../controllers/statistics_controller.dart';



class StatisticsView extends GetView<StatisticsController> {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: StatisticsController(),
      builder: (controller) {
         return Scaffold(
           backgroundColor: AppColors.primary,
           body: SafeArea(
             child: Stack(
               children: [
                 Column(
                   children: [
                     // 🔥 Fixed Top Logo & Black Hole
                     const CustomAssetIcon(path: 'logo', scale: 6).paddingOnly(top: 20.sp),
                     const ColorFiltered(
                         colorFilter: ColorFilter.matrix([
                           1, 0, 0, 0, 16,
                           0, 1, 0, 0, 16,
                           0, 0, 1, 0, 16,
                           0, 0, 0, 1, 0,
                         ]),
                         child: CustomAssetIcon(path: 'black-hole', scale: 3)),

                     // 🔥 Scrollable Content
                     Expanded(
                       child: SingleChildScrollView(
                         padding: EdgeInsets.only(bottom: 40.sp), // So content doesn’t hide behind button
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             // 👇 3h 52m (Now scrollable)
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 MyGradientText(
                                   text: '3h 52m',
                                   size: 26.sp,
                                   gradientColors: AppColors.screenTimeGradient,
                                 ),
                               ],
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 MyText(
                                   title: '[ Screen Time Today ]',
                                   clr: Colors.white,
                                   size: 16.sp,
                                   weight: FontWeight.w500,
                                 ),
                               ],
                             ),
                             SizedBox(height: 20.sp),

                             // 👇 MOST USED / IN THE VOID / ATTEMPTS
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 // MOST USED
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   children: [
                                     MyGradientText(
                                       text: 'MOST USED',
                                       size: 12.sp,
                                       weight: FontWeight.w600,
                                       gradientColors: AppColors.headingGradient,
                                     ),
                                     SizedBox(height: 10.sp),
                                     Row(
                                       children: [
                                         _appIconWithDot('whatsapp', Colors.white, 4),
                                        1.w.width,
                                         _appIconWithDot('snapchat', Colors.red, 4),
                                         1.w.width,
                                         _appIconWithDot('instagram', Colors.red, 4),
                                       ],
                                     ),
                                   ],
                                 ),
                                 // IN THE VOID
                                 _voidAttemptColumn('IN THE VOID', '54m'),
                                 // ATTEMPTS
                                 _voidAttemptColumn('ATTEMPTS', '9'),
                               ],
                             ).paddingOnly(left: 22.sp, right: 25.sp),
                             SizedBox(height: 2.5.h),

                             // 👇 Time Offline
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Row(
                                   children: [
                                     const CustomAssetIcon(path: 'time-offline'),
                                     SizedBox(width: 3.w),
                                     MyText(
                                       title: 'Time Offline',
                                       clr: Colors.white,
                                       size: 15.sp,
                                     ),
                                   ],
                                 ),
                                 MyGradientText(
                                   text: '3h 52m',
                                   size: 16.sp,
                                   weight: FontWeight.w600,
                                   gradientColors: AppColors.blueTextGradient,
                                 ),
                               ],
                             ).paddingSymmetric(horizontal: 17.sp),
                             SizedBox(height: 1.h),

                             // 👇 80% Text
                             Row(
                               children: [
                                 MyGradientText(
                                   text: '80% Of your day screen time',
                                   size: 15.sp,
                                   weight: FontWeight.w400,
                                   gradientColors: AppColors.blueTextGradient,
                                 ),
                               ],
                             ).paddingSymmetric(horizontal: 17.sp),
                             SizedBox(height: 1.h),

                             // 👇 ListView Replaced with Column
                             Column(
                               children: List.generate(
                                 controller.appData.length,
                                     (index) {
                                   final appData = controller.appData[index];

                                   return Padding(
                                     padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 15.sp),
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         // Row: Icon, Name, Time
                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             Row(
                                               children: [
                                                 CustomAssetIcon(
                                                   path: appData['icon'] as String,
                                                   scale: 2.5,
                                                 ),
                                                 SizedBox(width: 12.sp),
                                                 MyText(
                                                   title: appData['name'] as String,
                                                   clr: Colors.white,
                                                   size: 14.sp,
                                                   weight: FontWeight.w500,
                                                 ),
                                               ],
                                             ),
                                             MyGradientText(
                                               text: appData['time'] as String,
                                               size: 14.sp,
                                               weight: FontWeight.w500,
                                               gradientColors: AppColors.timeTextGradient,
                                             ),
                                           ],
                                         ),
                                         SizedBox(height: 1.h),

                                         // Progress Bar
                                         ClipRRect(
                                           borderRadius: BorderRadius.circular(4.sp),
                                           child: Stack(
                                             children: [
                                               Container(
                                                 height: 10.sp,
                                                 decoration: BoxDecoration(
                                                   color: AppColors.primary,
                                                   borderRadius: BorderRadius.circular(10),
                                                 ),
                                               ),
                                               LayoutBuilder(
                                                 builder: (context, constraints) {
                                                   double width = constraints.maxWidth * (appData['progress'] as double);
                                                   return Container(
                                                     width: width,
                                                     height: 10.sp,
                                                     decoration: BoxDecoration(
                                                       gradient: const LinearGradient(
                                                         colors: [
                                                           Color(0xFFFFFFFF),
                                                           Color(0xFF878787),
                                                         ],
                                                         begin: Alignment.centerLeft,
                                                         end: Alignment.centerRight,
                                                       ),
                                                       borderRadius: BorderRadius.circular(10),
                                                     ),
                                                   );
                                                 },
                                               ),
                                             ],
                                           ),
                                         ),
                                       ],
                                     ),
                                   );
                                 },
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),

                 // 🔥 Fixed "ENTER THE VOID" button
                 Align(
                   alignment: Alignment.bottomCenter,
                   child: Padding(
                     padding: EdgeInsets.all(16.sp),
                     child: GestureDetector(
                       onTap: () {
                         // TODO: Add your onTap functionality here
                       },
                       child: _enterTheVoidBtn(),
                     ),
                   ),
                 ),
               ],
             ),
           ),
         );
      },
    );
  }

  // 👇 Helper widget for app icon with dot
  Widget _appIconWithDot(String iconName, Color dotColor,double scale) {
    return Column(
      children: [
        CustomAssetIcon(path: iconName, scale: scale),
        SizedBox(height: 8.sp),
        Container(
          width: 8.sp,
          height: 8.sp,
          decoration: BoxDecoration(
            color: dotColor,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }


  Widget _voidAttemptColumn(String title,String subtitle){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MyGradientText(
          text: title,
          size: 12.sp,
          weight: FontWeight.w600,
          gradientColors: AppColors.headingGradient,
        ),
        SizedBox(height: 6.sp),
        MyGradientText(
          text: subtitle,
          size: 20.sp,
          weight: FontWeight.w500,
          gradientColors: AppColors.headingGradient,
        ),
      ],
    );
  }


  Widget _enterTheVoidBtn(){
    return Container(
      height: 7.h,
      decoration: BoxDecoration(
        color: AppColors.enterVoidBtn,
        borderRadius: BorderRadius.circular(30.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
            title: 'ENTER THE VOID',
            clr: Colors.black,
            size: 16.sp,
            weight: FontWeight.bold,
          ).paddingOnly(left: 40.sp),
          const Spacer(),
          CircleAvatar(
            backgroundColor: AppColors.white,
            radius: 20.sp,
            child: const CustomAssetIcon(
              path: 'sparkle', // Your sparkle icon
              scale: 3,
            ),
          ).paddingOnly(right: 13.sp),
        ],
      ),
    );
  }


}

