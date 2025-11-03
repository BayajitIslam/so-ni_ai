import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/home/widgets/meal_recommend_card.dart';
import 'package:template/features/home/widgets/week_day_selector.dart';

class AiGeneratedMealRecommendationsScreen extends StatelessWidget {
  const AiGeneratedMealRecommendationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              //Your Diary This Week
              Padding(
                padding: EdgeInsets.only(left: 24.w, top: 17.h),
                child: Column(
                  children: [
                    //title
                    Row(
                      children: [
                        Text(
                          "Your Meals This Week",
                          style: AppTextStyles.s20w5P(color: AppColors.black),
                        ),
                      ],
                    ),

                    //weekly Calander
                    WeekDateSelector(ishomeScreen: false),
                  ],
                ),
              ),

              //all meal list
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.0.w,
                  vertical: 23.h,
                ),
                child: Column(
                  children: [
                    //title
                    Row(
                      children: [
                        Text(
                          "Today’s Meals",
                          style: AppTextStyles.s20w5P(color: AppColors.black),
                        ),
                      ],
                    ),

                    //
                    MealRecommendCard(title: "breakfast"),
                    MealRecommendCard(title: "lunch"),
                    MealRecommendCard(title: "Dinner"),
                    MealRecommendCard(title: "Snack"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
