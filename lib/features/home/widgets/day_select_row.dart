import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/core/constants/app_colors.dart';

class DaySelectionRow extends StatefulWidget {
  const DaySelectionRow({super.key});

  @override
  State<DaySelectionRow> createState() => _DaySelectionRowState();
}

class _DaySelectionRowState extends State<DaySelectionRow> {
  // A simple list to represent your days
  final List<String> days = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thur', 'Fri'];
  // Keep track of which days are "selected" or "completed"
  final RxList<String> selectedDays = ['Sat', 'Sun', 'Mon'].obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104.h,
      decoration: BoxDecoration(
        color: AppColors.yellowishLightOrange,
        borderRadius: BorderRadius.circular(8.r),
      ),
      margin: EdgeInsets.only(left: 25.w),
      padding: EdgeInsets.only(left: 10, top: 20, bottom: 20),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
        itemBuilder: (context, index) {
          final String day = days[index];
          final bool isSelected = selectedDays.contains(day);

          return Obx(() {
            // Use Obx to react to changes in selectedDays
            final bool isCurrentDaySelected = selectedDays.contains(day);
            return GestureDetector(
              onTap: () {
                // Toggle selection
                if (isCurrentDaySelected) {
                  selectedDays.remove(day);
                } else {
                  selectedDays.add(day);
                }
              },
              child: Container(
                width: 43.w, // Fixed width for each day box
                height: 69.h,
                decoration: BoxDecoration(
                  color: AppColors.brandText, // Lighter color when not selected
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isCurrentDaySelected
                          ? Icons.check_circle
                          : Icons.check_circle_outline,
                      size: 20.sp,
                      color: isCurrentDaySelected
                          ? AppColors.icon
                          : AppColors.white,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      day,
                      style: GoogleFonts.lato(
                        color: isCurrentDaySelected
                            ? AppColors.white.withOpacity(0.8)
                            : AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
