import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/core/themes/app_text_style.dart';

class TrialTimeline extends StatelessWidget {
  const TrialTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Timeline Icon and Line
        Stack(
          children: [
            Container(
              height: 262.h,
              width: 12.w,
              margin: EdgeInsets.symmetric(horizontal: 12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                gradient: LinearGradient(
                  // Define the colors for the gradient
                  colors: [
                    AppColors.brandText,
                    AppColors.brandText,
                    AppColors.greyNormal,
                  ],
                  // Define where the gradient starts and ends
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // Optional: You can stop the colors at specific points
                  // stops: [0.0, 0.5, 1.0],
                ),
              ),
            ),

            //Icon
            Positioned(
              top: 0.h,
              child: CircleAvatar(
                radius: 18.r,
                backgroundColor: AppColors.brandText,
                child: Icon(
                  Icons.lock_outline,
                  color: AppColors.white,
                  size: 20.sp,
                ),
              ),
            ),

            //Icon
            Positioned(
              top: 85.h,
              child: CircleAvatar(
                radius: 18.r,
                backgroundColor: AppColors.brandText,
                child: Icon(
                  Icons.notifications_outlined,
                  color: AppColors.white,
                  size: 20.sp,
                ),
              ),
            ),

            //Icon
            Positioned(
              top: 170.h,
              child: CircleAvatar(
                radius: 18.r,
                backgroundColor: AppColors.greyNormal,
                child: Icon(
                  Icons.workspace_premium_outlined,
                  color: AppColors.white,
                  size: 20.sp,
                ),
              ),
            ),
          ],
        ),

        SizedBox(width: 15.w),
        //Content
        Stack(
          children: [
            SizedBox(height: 262.h, width: 294.w),

            Positioned(
              top: 0.h,
              child: Expanded(
                child: _textCard(
                  AppString.today,
                  AppString.getFullAccessAndSeeYourMindset,
                ),
              ),
            ),

            Positioned(
              top: 85.h,
              child: Expanded(
                child: _textCard(
                  AppString.day2,
                  AppString.getAreminderThatYourTrialEndsIn,
                ),
              ),
            ),
            Positioned(
              top: 166.h,
              child: Expanded(
                child: _textCard(
                  AppString.after3Day,
                  AppString.yourFreeTrailEndsAndYouWillbeCharged,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget _textCard(String title, description) {
  return Padding(
    padding: EdgeInsets.only(top: 4.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.s20w5P(color: AppColors.greyNormal)),
        SizedBox(height: 4.h),
        Text(
          description,
          style: AppTextStyles.s13w4P(color: AppColors.greyNormal),
        ),
      ],
    ),
  );
}
