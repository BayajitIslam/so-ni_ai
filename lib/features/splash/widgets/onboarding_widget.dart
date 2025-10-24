import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/themes/app_text_style.dart';

class OnboardingWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final VoidCallback onNextTap;
  const OnboardingWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.onNextTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image with rounded corners and gradient shadow
              SizedBox(height: 75.h),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r),
                    ), // Rounded corners for the image
                    child: Center(
                      child: Image.asset(
                        imageUrl,
                        height: 573.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child:
                        // Gradient shadow at the bottom
                        Container(
                          height: 150.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                AppColors.brand, // Gradient color for shadow
                              ],
                            ),
                          ),
                        ),
                  ),
                ],
              ),
              SizedBox(height: 48.h),
              // Title Text
              Text(title, style: AppTextStyles.s20w6P(color: AppColors.icon)),
              SizedBox(height: 10.h),
              // Description Text
              Text(
                description,
                style: AppTextStyles.s16w5P(color: AppColors.icon),
              ),
              SizedBox(height: 31.h),
              // Next Arrow Button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: onNextTap,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppColors.buttonBg,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 24.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
