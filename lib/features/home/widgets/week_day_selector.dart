import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/themes/app_text_style.dart';

class WeekDateSelector extends StatefulWidget {
  final bool ishomeScreen;
  const WeekDateSelector({super.key, this.ishomeScreen = true});

  @override
  State<WeekDateSelector> createState() => _WeekDateSelectorState();
}

class _WeekDateSelectorState extends State<WeekDateSelector> {
  DateTime selectedDate = DateTime.now();
  late DateTime startOfWeek;

  @override
  void initState() {
    super.initState();
    startOfWeek = selectedDate.subtract(
      Duration(days: selectedDate.weekday % 7),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: widget.ishomeScreen
            ? AppColors.yellowishLightOrange
            : Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: SingleChildScrollView(
        // Make the Row scrollable horizontally
        scrollDirection: Axis.horizontal, // Horizontal Scroll
        child: Row(
          children: List.generate(7, (index) {
            final day = startOfWeek.add(Duration(days: index));
            final isSelected =
                day.day == selectedDate.day && day.month == selectedDate.month;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedDate = day;
                });
                widget.ishomeScreen ? _showActivityPopup(context) : Container();
              },
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: widget.ishomeScreen
                          ? Colors.transparent
                          : isSelected
                          ? AppColors.yellowishLightOrange
                          : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r),
                        bottomLeft: Radius.circular(50.r),
                        bottomRight: Radius.circular(50.r),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 10.w,
                    ),
                    child: Column(
                      children: [
                        Text(
                          _getWeekdayName(day),
                          style: GoogleFonts.lato(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        CircleAvatar(
                          radius: 22.r,
                          backgroundColor: isSelected
                              ? AppColors.buttonBg
                              : AppColors.brandText.withOpacity(0.8),
                          child: Text(
                            '${day.day}',
                            style: GoogleFonts.lato(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  String _getWeekdayName(DateTime date) {
    return ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"][date.weekday % 7];
  }

  // Function to show activity popup
  void _showActivityPopup(BuildContext context) {
    Get.bottomSheet(
      isScrollControlled: true,
      Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.yellowishLightOrange),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Text(
                "Activity",
                style: AppTextStyles.s20w5P(color: AppColors.icon),
              ),
            ),
            SizedBox(height: 20.h),
            Column(
              children: [
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
                _buildActivityItem('Squats', '07 Min', '3 Sets', '40 Calories'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build each activity item
  Widget _buildActivityItem(
    String name,
    String time,
    String sets,
    String calories,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.all(15.w),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: AppTextStyles.s16w5P(color: AppColors.black)),
              SizedBox(height: 5.h),
              Text(
                '$time | $sets | $calories',
                style: AppTextStyles.s14w4P(color: AppColors.icon),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
