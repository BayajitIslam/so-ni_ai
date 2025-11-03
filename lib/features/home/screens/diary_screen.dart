import 'dart:math' as math;

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

                                  onTap: () {
                                    showWaterIntakePopup(context);
                                  },
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

                                  onTap: () {
                                    showSleepLogPopup(context);
                                  },
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

// ============================================
// 🎯 USE THIS FUNCTION - Just call it!
// ============================================
void showWaterIntakePopup(BuildContext context, {double percentage = 78.6}) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      child: WaterIntakePopupWidget(percentage: percentage),
    ),
  );
}

// ============================================
// Water Intake Popup Widget
// ============================================
class WaterIntakePopupWidget extends StatelessWidget {
  final double percentage;

  const WaterIntakePopupWidget({super.key, this.percentage = 78.6});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColors.brand,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          Text(
            "Water Intake",
            style: AppTextStyles.s20w5P(color: AppColors.icon),
          ),
          SizedBox(height: 24.h),

          // Circular Progress
          SizedBox(
            width: 140.w,
            height: 140.w,
            child: CustomPaint(
              painter: CircularProgressPainter(
                progress: percentage / 100,
                backgroundColor: const Color(0xFFe0c7a6),
                progressColor: AppColors.brandText,
              ),
              child: Center(
                child: Text(
                  '${percentage.toStringAsFixed(1)}%',
                  style: AppTextStyles.s16w4I(
                    fontSize: 24,
                    fontweight: FontWeight.w900,
                    color: AppColors.brandText,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 28.h),

          // Add Button
          CustomButton(
            textStyle: AppTextStyles.s14w5P(),
            verticlePadding: 16.h,
            title: "Add 2 Glass",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

// ============================================
// Circular Progress Painter
// ============================================
class CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color progressColor;

  CircularProgressPainter({
    required this.progress,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;
    const strokeWidth = 14.0;

    // Background circle
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Progress arc
    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2, // Start from top
      2 * math.pi * progress, // Progress angle
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// ============================================
// 🎯 USE THIS FUNCTION - Just call it!
// ============================================
void showSleepLogPopup(BuildContext context, {double initialHours = 7.0}) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      child: SleepLogPopupWidget(initialHours: initialHours),
    ),
  );
}

// ============================================
// Sleep Log Popup Widget
// ============================================
class SleepLogPopupWidget extends StatefulWidget {
  final double initialHours;

  const SleepLogPopupWidget({super.key, this.initialHours = 7.0});

  @override
  State<SleepLogPopupWidget> createState() => _SleepLogPopupWidgetState();
}

class _SleepLogPopupWidgetState extends State<SleepLogPopupWidget> {
  late double sleepHours;

  @override
  void initState() {
    super.initState();
    sleepHours = widget.initialHours;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColors.brand,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Inner Card
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: AppColors.yellowishLightOrange,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Center(
                  child: Text(
                    "Sleep Log",
                    style: AppTextStyles.s16w5P(color: AppColors.icon),
                  ),
                ),
                SizedBox(height: 20.h),

                // Sleep hours display
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Sleep",
                      style: AppTextStyles.s16w4P(
                        color: AppColors.brandText,
                        fontweight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),

                // Hours value
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${sleepHours.toStringAsFixed(0)}h',
                      style: AppTextStyles.s14w4P(
                        color: AppColors.brandText,
                        fontweight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                // Slider
                SizedBox(height: 4.h),
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 7.h,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.r),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 18.r),
                    activeTrackColor: Color(0xFF8B7355),
                    inactiveTrackColor: Color(0xFFE5D4BE),
                    thumbColor: Color(0xFF8B7355),
                    overlayColor: Color(0xFF8B7355).withOpacity(0.2),
                    padding: EdgeInsets.all(0),
                  ),
                  child: Slider(
                    value: sleepHours,
                    min: 0,
                    max: 12,
                    divisions: 24, // 0.5 hour intervals
                    onChanged: (value) {
                      setState(() {
                        sleepHours = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),

          // Add Button
          CustomButton(
            textStyle: AppTextStyles.s14w5P(),
            verticlePadding: 16.h,
            title: "Save",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
