import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/home/controllers/home_controller.dart';
import 'package:template/features/home/widgets/activity_card.dart';
import 'package:template/features/home/widgets/day_select_row.dart';
import 'package:template/features/home/widgets/sleep_tracking_card.dart';
import 'package:template/features/home/widgets/water_goal_card.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 9.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. your Daily calories
                      Text(
                        AppString.yourDailyCalories,
                        style: AppTextStyles.s20w5P(color: AppColors.black),
                      ),
                      SizedBox(height: 15.h),
                      ActivityCard(
                        title: 'Daily Progress',
                        currentValue: 500,
                        totalValue: 1000,
                        currentCarbs: 60,
                        totalCarbs: 100,
                        currentProtein: 80,
                        totalProtein: 100,
                        currentFat: 20,
                        totalFat: 50,
                      ),

                      SizedBox(height: 13.h),
                      // 2. your Weekly calories
                      Text(
                        AppString.yourWeeklyCalories,
                        style: AppTextStyles.s20w5P(color: AppColors.black),
                      ),
                      SizedBox(height: 15.h),
                      ActivityCard(
                        title: 'your Weekly calories',
                        currentValue: 500,
                        totalValue: 5000,
                        currentCarbs: 75,
                        totalCarbs: 120,
                        currentProtein: 90,
                        totalProtein: 150,
                        currentFat: 30,
                        totalFat: 60,
                      ),

                      //Meal Plan Calendar - customize your three days
                      SizedBox(height: 13.h),
                      Text(
                        AppString.yourWeeklyCalories,
                        style: AppTextStyles.s20w5P(color: AppColors.black),
                      ),

                      SizedBox(height: 13.h),
                      Text(
                        AppString.customizeYourThreeDays,
                        style: AppTextStyles.s14w4P(color: AppColors.black),
                      ),
                    ],
                  ),
                ),

                //Your Weekly Calories
                SizedBox(height: 15.h),
                DaySelectionRow(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    children: [
                      WaterGoalCard(currentGlasses: 24, totalGlasses: 100),
                      SizedBox(height: 20.h),
                      SleepTrackingCard(
                        lastNightDuration: const Duration(
                          hours: 7,
                          minutes: 12,
                        ),
                        weeklyAvgDuration: const Duration(
                          hours: 6,
                          minutes: 45,
                        ),
                        targetGoalDuration: const Duration(hours: 8),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // workout Progress
                      Text(
                        AppString.workWoutProgress,
                        style: AppTextStyles.s20w5P(color: AppColors.black),
                      ),

                      SizedBox(height: 13.h),
                      // 3. your Daily Workout Progress
                      Text(
                        AppString.yourDailyWorkoutProgress,
                        style: AppTextStyles.s20w5P(color: AppColors.black),
                      ),
                      SizedBox(height: 15.h),
                      ActivityCard(
                        title: 'your Daily Workout Progress',
                        currentValue: 500,
                        totalValue: 500,
                        currentExercise: 3,
                        totalExercise: 5,
                        currentVideo: 6,
                        totalVideo: 10,
                        currentDuration: 0,
                        totalDuration: 200,
                        istargetKcal: true,
                        isDuration: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
