import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/translations.dart';
import 'package:template/core/themes/app_text_style.dart';

class SleepTrackingCard extends StatelessWidget {
  final Duration lastNightDuration;
  final Duration weeklyAvgDuration;
  final Duration targetGoalDuration;

  const SleepTrackingCard({
    super.key,
    required this.lastNightDuration,
    required this.weeklyAvgDuration,
    required this.targetGoalDuration,
  });

  // Helper to format duration to "Xh Ym"
  String _formatDuration(Duration duration) {
    return '${duration.inHours}h ${duration.inMinutes.remainder(60)}m';
  }

  @override
  Widget build(BuildContext context) {
    final double progress =
        (lastNightDuration.inMinutes / targetGoalDuration.inMinutes).clamp(
          0.0,
          1.0,
        );
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.latNight,
                    style: AppTextStyles.s14w4P(color: AppColors.black),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    _formatDuration(lastNightDuration),
                    style: AppTextStyles.s16w5P(color: AppColors.black),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    AppString.weeklyAvg,
                    style: AppTextStyles.s14w4P(color: AppColors.black),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    _formatDuration(weeklyAvgDuration),
                    style: AppTextStyles.s16w5P(color: AppColors.black),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            '$percentage% of ${_formatDuration(targetGoalDuration)} goal',
            style: AppTextStyles.s16w4I(color: AppColors.brandBorder),
          ),
          SizedBox(height: 10.h),
          // Custom linear progress indicator for sleep
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
