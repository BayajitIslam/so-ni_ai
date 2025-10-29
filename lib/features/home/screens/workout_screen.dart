import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/auth/widgets/custom_button.dart';
import 'package:template/features/home/widgets/custome_checkbox.dart';
import 'package:template/features/home/widgets/week_day_selector.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 24.w, top: 17.h),
                child: Column(
                  children: [
                    //title
                    Row(
                      children: [
                        Text(
                          "Your workouts This Week",
                          style: AppTextStyles.s20w5P(color: AppColors.black),
                        ),
                      ],
                    ),

                    //weekly Calander
                    WeekDateSelector(ishomeScreen: false),
                  ],
                ),
              ),

              //
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    //cover photos
                    _buildCover(
                      title: "it’s your upper body day! ",
                      subtitle: "40 min | medium | 500 calories",
                      imagePath: "assets/images/fitness.png",
                    ),

                    //
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.5.h),
                      child: Row(
                        children: [
                          Text(
                            "Warmup",
                            style: AppTextStyles.s20w5P(color: AppColors.black),
                          ),
                        ],
                      ),
                    ),

                    //lIST
                    _buildActivityItem(
                      'Leg Stretching',
                      '03 Min',
                      '3 Sets',
                      '30 Calories',
                    ),
                    _buildActivityItem(
                      'Push-ups',
                      '05 Min',
                      '4 Sets',
                      '50 Calories',
                    ),
                    _buildActivityItem(
                      'Squats',
                      '07 Min',
                      '3 Sets',
                      '40 Calories',
                    ),

                    //

                    //
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.5.h),
                      child: Row(
                        children: [
                          Text(
                            "Upper Body Workout",
                            style: AppTextStyles.s20w5P(color: AppColors.black),
                          ),
                        ],
                      ),
                    ),

                    //lIST
                    _buildActivityItem(
                      'Leg Stretching',
                      '03 Min',
                      '3 Sets',
                      '30 Calories',
                    ),
                    _buildActivityItem(
                      'Push-ups',
                      '05 Min',
                      '4 Sets',
                      '50 Calories',
                    ),
                    _buildActivityItem(
                      'Squats',
                      '07 Min',
                      '3 Sets',
                      '40 Calories',
                    ),
                  ],
                ),
              ),
              //Complete Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: CustomButton(
                  verticlePadding: 16,
                  textStyle: AppTextStyles.s16w4P(),
                  title: "Complete",
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Helper function to build each activity item ---------------------------
Widget _buildActivityItem(
  String name,
  String time,
  String sets,
  String calories,
) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8.h),
    padding: EdgeInsets.symmetric(horizontal: 13.5.w, vertical: 20.h),
    decoration: BoxDecoration(
      color: AppColors.yellowishLightOrange,
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Image.asset(
            'assets/images/leg.png', // Add your image asset path here
            width: 147.w,
            height: 113.h,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10.w),
        SizedBox(
          height: 107.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 191.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //title
                    Text(
                      name,
                      style: AppTextStyles.s16w5P(color: AppColors.black),
                    ),

                    //switch to complete
                    CustomCheckbox(),
                  ],
                ),
              ),

              SizedBox(height: 15.h),
              Text(
                '$time | $sets | $calories',
                style: AppTextStyles.s14w4P(color: AppColors.icon),
              ),

              //PLAY VIDEO BUTTON
              SizedBox(height: 15.h),
              SizedBox(
                width: 191.w,
                child: CustomButton(
                  radius: 10,
                  verticlePadding: 10,
                  textStyle: AppTextStyles.s16w4P(),
                  title: "Play Video",
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

//---------------------------- Bennar ----------------------------
Widget _buildCover({
  required String imagePath, // Customizable image path
  required String title, // Title text
  required String subtitle, // Subtitle text
  double? height, // Customizable height
  BoxFit? fit, // Image fit
  BorderRadiusGeometry? borderRadius, // Customizable border radius
}) {
  return Container(
    height: height ?? 179.h, // Default height if not provided
    decoration: BoxDecoration(
      borderRadius:
          borderRadius ?? BorderRadius.circular(8.r), // Default border radius
    ),
    child: Stack(
      children: [
        // Image
        ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(8.r),
          child: Image.asset(
            imagePath,
            width: double.infinity,
            height: double.infinity,
            fit: fit ?? BoxFit.cover,
          ),
        ),
        // Black shadow overlay
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(8.r),
              gradient: LinearGradient(
                begin: AlignmentGeometry.centerRight,
                end: AlignmentGeometry.centerLeft,
                colors: [
                  AppColors.black.withOpacity(0.2),
                  AppColors.black.withOpacity(0.35),
                  AppColors.black.withOpacity(0.42),
                  AppColors.black.withOpacity(0.5),
                ],
              ),
            ),
          ),
        ),
        // Title and Subtitle
        Positioned(
          top: 65.h, // Adjust to place title where desired
          left: 15.w, // Adjust to place title on left side
          right: 15.w, // Adjust to make space on right side
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.s20w5P(color: AppColors.white)),
              SizedBox(height: 6.5.h), // Space between title and subtitle
              Text(
                subtitle,
                style: AppTextStyles.s14w4P(color: AppColors.white),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
