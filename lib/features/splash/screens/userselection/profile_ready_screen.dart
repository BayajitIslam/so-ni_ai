import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/core/constants/image_const.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/auth/widgets/custom_button.dart';
import 'package:template/routes/routes_name.dart';

class ProfileReadyScreen extends StatelessWidget {
  const ProfileReadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Emoji
            Center(child: Image.asset(AppImages.greatEmoji)),

            SizedBox(height: 60.h),
            //Great!
            Text(AppString.great, style: AppTextStyles.s40w6P()),

            SizedBox(height: 20.h),
            //Your Profile Ready
            Text(AppString.yourProfileIsReady, style: AppTextStyles.s24w5P()),

            SizedBox(height: 15.h),
            //Lets Start Building
            Text(
              AppString.letsStartBuildingHealth,
              textAlign: TextAlign.center,
              style: AppTextStyles.s24w5P(),
            ),

            SizedBox(height: 159.h),
            //Go to Homepage
            CustomButton(
              textStyle: AppTextStyles.s16w5P(),
              title: AppString.gotoHomePages,
              onTap: () => Get.offAllNamed(RoutesName.homeNavScreen),
            ),

            SizedBox(height: 92.h),
          ],
        ),
      ),
    );
  }
}
