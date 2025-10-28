import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/image_const.dart';
import 'package:template/core/constants/my_icons.dart';

import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/auth/widgets/custom_button.dart';
import 'package:template/features/home/widgets/diary_meal_card.dart';
import 'package:template/features/home/widgets/week_day_selector.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                          "Your Diary This Week",
                          style: AppTextStyles.s20w5P(color: AppColors.black),
                        ),
                      ],
                    ),

                    //weekly Calander
                    WeekDateSelector(ishomeScreen: false),
                  ],
                ),
              ),

              //list
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    //title
                    Row(
                      children: [
                        Text(
                          "Your Diary",
                          style: AppTextStyles.s20w5P(color: AppColors.black),
                        ),
                      ],
                    ),
                    //list
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.buttonBg,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      margin: EdgeInsets.only(top: 15.h, bottom: 20.h),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          DiaryMealCard(title: "Breackfast"),
                          SizedBox(height: 12.h),

                          DiaryMealCard(title: "Snack"),
                          SizedBox(height: 12.h),

                          DiaryMealCard(title: "Lunch"),
                        ],
                      ),
                    ),

                    //
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.buttonBg,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      margin: EdgeInsets.only(bottom: 20.h),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          //log sleep
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.yellowishLightOrange,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 18.w,
                              vertical: 20.5.h,
                            ),
                            child: Column(
                              children: [
                                //icon and name
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //icon
                                    CircleAvatar(
                                      radius: 25.r,
                                      backgroundColor: AppColors.white,
                                      child: Icon(
                                        MyIcons.sleep,
                                        color: AppColors.icon,
                                        size: 22.sp,
                                      ),
                                    ),
                                    //text
                                    Text("90% of Goal"),

                                    //name
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sleep",
                                          style: AppTextStyles.s16w6M(),
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          "7hours",
                                          style: AppTextStyles.s14w5M(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //
                                SizedBox(height: 10.h),

                                SizedBox(height: 10.h),
                                //change meal button
                                CustomButton(
                                  title: "Log Sleep",
                                  verticlePadding: 14,
                                  radius: 25,
                                  textStyle: AppTextStyles.s14w5P(),

                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12.h),

                          //add Glass
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.yellowishLightOrange,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 18.w,
                              vertical: 20.5.h,
                            ),
                            child: Column(
                              children: [
                                //icon and name
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //icon
                                    CircleAvatar(
                                      radius: 25.r,
                                      backgroundColor: AppColors.white,
                                      child: SvgPicture.asset(
                                        AppImages.waterOutline,
                                      ),
                                    ),

                                    //name
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Water",
                                          style: AppTextStyles.s16w6M(),
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          "3/8\nGlass",
                                          style: AppTextStyles.s14w5M(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //
                                SizedBox(height: 10.h),

                                SizedBox(height: 10.h),
                                //change meal button
                                CustomButton(
                                  title: "Add Glass",
                                  verticlePadding: 14,
                                  radius: 25,
                                  textStyle: AppTextStyles.s14w5P(),

                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
