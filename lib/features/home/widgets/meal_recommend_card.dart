import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/auth/widgets/custom_button.dart';

class MealRecommendCard extends StatelessWidget {
  final String title;
  final bool isTitleDisable;
  final bool isScreen;
  const MealRecommendCard({
    super.key,
    this.title = "",
    this.isTitleDisable = false,
    this.isScreen = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //title
        isTitleDisable ? SizedBox.shrink() : SizedBox(height: 12.h),
        isTitleDisable
            ? SizedBox.shrink()
            : Row(
                children: [
                  Text(
                    title,
                    style: AppTextStyles.s20w5P(
                      color: AppColors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),

        //main Container
        SizedBox(height: 16.h),
        Container(
          decoration: BoxDecoration(color: AppColors.yellowishLightOrange),
          child: _buildActivityItem("Greek Yogurt", "Calories : 320", isScreen),
        ),
      ],
    );
  }
}

// Helper function to build each activity item
Widget _buildActivityItem(String name, String calories, bool isScreen) {
  return Container(
    padding: EdgeInsets.only(left: 16.w, right: 10.w, top: 17.h, bottom: 17.h),
    decoration: BoxDecoration(
      color: AppColors.yellowishLightOrange,
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(color: AppColors.brandBorder),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          blurRadius: 4,
          spreadRadius: 0,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Image.asset(
            'assets/images/demoOnly.png', // Add your image asset path here
            width: 113.w,
            height: 89.h,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: AppTextStyles.s16w7M(color: AppColors.black)),
            SizedBox(height: 10.h),
            Text(calories, style: AppTextStyles.s12w6M(color: AppColors.icon)),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //button
                SizedBox(
                  width: 110.w,
                  height: 34.h,
                  child: CustomButton(
                    textStyle: AppTextStyles.s12w5P(color: AppColors.white),
                    radius: 8,
                    verticlePadding: 8,
                    title: "Add On Diary",
                    onTap: () {},
                  ),
                ),
                SizedBox(width: 10.h),
                //button
                SizedBox(
                  width: 110.w,
                  height: 32.h,
                  child: CustomButton(
                    textStyle: AppTextStyles.s12w5P(),
                    radius: 8,
                    verticlePadding: 8,
                    title: "swap meal",
                    onTap: isScreen ? _showSwapMeal : null,
                    color: Colors.transparent,
                    isBorderEnable: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

//Show Swap Meal With Option

void _showSwapMeal() {
  Get.bottomSheet(
    isScrollControlled: true,
    Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.brand,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 76.w,
            height: 3.h,
            decoration: BoxDecoration(
              color: AppColors.buttonBg,
              borderRadius: BorderRadius.circular(3.r),
            ),
          ),

          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.brand),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
            child: Text(
              "Swap Your Meal with Equal Calories",
              style: AppTextStyles.s20w5P(color: AppColors.icon),
            ),
          ),
          Column(
            children: [
              MealRecommendCard(isTitleDisable: true, isScreen: false),
              MealRecommendCard(isTitleDisable: true, isScreen: false),
              MealRecommendCard(isTitleDisable: true, isScreen: false),
              MealRecommendCard(isTitleDisable: true, isScreen: false),
            ],
          ),
        ],
      ),
    ),
  );
}
