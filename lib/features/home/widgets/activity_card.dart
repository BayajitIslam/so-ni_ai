import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/core/constants/image_const.dart';
import 'package:template/core/constants/my_icons.dart';
import 'package:template/core/themes/app_text_style.dart';

class ActivityCard extends StatelessWidget {
  final String
  title; // e.g., "Daily Progress", "Daily Calories", "Weekly Progress"
  final int currentValue; // Current calorie value
  final int totalValue; // Total target value
  final int? currentCarbs;
  final int? totalCarbs;
  final int? currentProtein;
  final int? totalProtein;
  final int? currentFat;
  final int? totalFat;
  final int? currentExercise;
  final int? totalExercise;
  final int? currentVideo;
  final int? totalVideo;
  final int? currentDuration;
  final int? totalDuration;
  final bool istargetKcal;
  final bool isDuration;

  const ActivityCard({
    super.key,
    required this.title,
    required this.currentValue,
    required this.totalValue,
    this.currentCarbs,
    this.totalCarbs,
    this.currentProtein,
    this.totalProtein,
    this.currentFat,
    this.totalFat,
    this.totalExercise,
    this.currentExercise,
    this.totalVideo,
    this.currentVideo,
    this.totalDuration,
    this.currentDuration,
    this.istargetKcal = false,
    this.isDuration = false,
  });

  @override
  Widget build(BuildContext context) {
    double progressPercentage = (currentValue / totalValue) * 100;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 35.h),
      decoration: BoxDecoration(
        color: AppColors.yellowishLightOrange,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              // Circular Progress Gauge
              SizedBox(
                height: 349.h,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      maximum: 100,
                      startAngle: 180,
                      endAngle: 0,
                      showLabels: false,
                      showTicks: false,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.09,
                        cornerStyle: CornerStyle.bothFlat,
                        color: const Color.fromARGB(96, 47, 47, 47),
                        thicknessUnit: GaugeSizeUnit.factor,
                      ),
                      pointers: <GaugePointer>[
                        RangePointer(
                          value: progressPercentage,
                          cornerStyle: CornerStyle.bothFlat,
                          width: 0.09,
                          sizeUnit: GaugeSizeUnit.factor,
                          color: AppColors.buttonBg,
                        ),
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          positionFactor: 0.50,
                          angle: 90,
                          widget: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(MyIcons.fire, color: AppColors.fire),
                              SizedBox(height: 8.h),
                              Text(
                                currentValue.toString(),
                                style: AppTextStyles.s24w5P(
                                  color: AppColors.black,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                istargetKcal
                                    ? AppString.targetKcal
                                    : AppString.kcalTotal,
                                style: AppTextStyles.s20w5P(
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Start label (0)
                        GaugeAnnotation(
                          angle: 172,
                          positionFactor: 0.95,
                          widget: Text(
                            '0',
                            style: AppTextStyles.s20w5P(color: AppColors.black),
                          ),
                        ),
                        // End label (total)
                        GaugeAnnotation(
                          angle: 8,
                          positionFactor: 0.88,
                          widget: Text(
                            totalValue.toString(),
                            style: AppTextStyles.s20w5P(color: AppColors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //MacroCard
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MacroCard(
                        icon: istargetKcal
                            ? AppImages.dumbbell
                            : AppImages.gluten,
                        label: istargetKcal
                            ? AppString.exercise
                            : AppString.carbs,
                        current: istargetKcal
                            ? (currentExercise ?? 0)
                            : (currentCarbs ?? 0),
                        total: istargetKcal
                            ? (totalExercise ?? 0)
                            : (totalCarbs ?? 0),
                        isKcalTotal: istargetKcal,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: MacroCard(
                        icon: istargetKcal
                            ? AppImages.hourglass
                            : AppImages.meat,
                        label: istargetKcal
                            ? AppString.video
                            : AppString.protein,
                        current: istargetKcal
                            ? (currentVideo ?? 0)
                            : (currentProtein ?? 0),
                        total: istargetKcal
                            ? (totalVideo ?? 0)
                            : (totalProtein ?? 0),
                        isKcalTotal: istargetKcal,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: MacroCard(
                        icon: istargetKcal ? AppImages.youtube : AppImages.fat,
                        label: istargetKcal
                            ? AppString.duration
                            : AppString.fat,
                        current: istargetKcal
                            ? (currentDuration ?? 0)
                            : (currentFat ?? 0),
                        total: istargetKcal
                            ? (totalDuration ?? 0)
                            : (totalFat ?? 0),
                        isKcalTotal: istargetKcal,
                        isDuration: isDuration,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Macro Card Widget
class MacroCard extends StatelessWidget {
  final String icon;
  final String label;
  final int current;
  final int total;
  final bool isKcalTotal;
  final bool isDuration;

  const MacroCard({
    super.key,
    required this.icon,
    required this.label,
    required this.current,
    required this.total,
    required this.isKcalTotal,
    this.isDuration = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.buttonBg,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: AppColors.icon.withOpacity(0.7),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(icon, fit: BoxFit.cover),
          ),
          SizedBox(height: 10.h),
          Text(label, style: AppTextStyles.s16w4P(color: AppColors.white)),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isDuration ? '$total' : '$current/$total',
                style: AppTextStyles.s14w5P(color: AppColors.white),
              ),
              SizedBox(width: 2.w),
              Text(
                isKcalTotal
                    ? isDuration
                          ? "Min"
                          : ""
                    : "gm",
                style: AppTextStyles.s14w5P(
                  // ignore: deprecated_member_use
                  color: AppColors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
