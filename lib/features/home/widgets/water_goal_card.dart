import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/translations.dart';
import 'package:template/core/themes/app_text_style.dart';

class WaterGoalCard extends StatelessWidget {
  final int currentGlasses;
  final int totalGlasses;

  const WaterGoalCard({
    super.key,
    required this.currentGlasses,
    required this.totalGlasses,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = (currentGlasses / totalGlasses).clamp(0.0, 1.0);
    final int percentage = (progress * 100).toInt();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColors.yellowishLightOrange,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: const Color.fromRGBO(136, 98, 58, 0.3),
                child: Icon(
                  Icons.water_drop_outlined, // Water drop icon
                  color: AppColors.brandText,
                  size: 20.sp,
                ),
              ),
              Text(
                AppString.yourWaterGoal,
                style: AppTextStyles.s16w5P(color: AppColors.icon),
              ),
              Container(
                width: 47.w,
                height: 25.h,
                decoration: BoxDecoration(
                  color: AppColors.brand,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Center(
                  child: Text(
                    '$percentage%',
                    style: AppTextStyles.s14w4P(color: AppColors.black),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                currentGlasses.toString(),
                style: AppTextStyles.s20w7I(
                  color: AppColors.brandText,
                  fontSize: 25,
                ),
              ),
              Text(
                ' /$totalGlasses Glass', // Added space before / for clarity
                style: AppTextStyles.s12w5I(
                  color: AppColors.black,
                  fontweight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Custom linear progress indicator
          Stack(
            children: [
              Container(
                height: 8.h,
                decoration: BoxDecoration(
                  color: AppColors.brandBorder.withOpacity(
                    0.2,
                  ), // Background of the progress bar
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
              FractionallySizedBox(
                widthFactor: progress,
                child: Container(
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: AppColors.brandText, // Progress color
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
