import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'dart:async';

import 'package:template/routes/routes_name.dart'; // Import for the Timer functionality

class NextExerciseScreen extends StatefulWidget {
  const NextExerciseScreen({super.key});

  @override
  State<NextExerciseScreen> createState() => _NextExerciseScreenState();
}

class _NextExerciseScreenState extends State<NextExerciseScreen> {
  bool isPlaying = true;
  int currentSeconds = 0;
  int totalSeconds = 300; // 5 minutes timer
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start the timer when the page loads
    _startTimer();
  }

  // Function to start the timer
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentSeconds < totalSeconds) {
        setState(() {
          currentSeconds++;
        });
      } else {
        _timer.cancel();
        // After the timer finishes, navigate to the next page
        Get.offNamed(RoutesName.workoutVideoPlayerScreen);
      }
    });
  }

  // Function to format the time
  String _formatTime(int seconds) {
    int mins = seconds ~/ 60;
    int secs = seconds % 60;
    return '${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    double progress = currentSeconds / totalSeconds;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image for exercise
            Container(
              width: 150.w,
              height: 129.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/exercise.png",
                  ), // Replace with your image path
                  fit: BoxFit.cover,
                ),
                border: Border.all(color: AppColors.white),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),

            // Text "Next Exercise"
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Next Exercise",
                  style: AppTextStyles.s20w5P(color: AppColors.black),
                ),
                Icon(Icons.arrow_right_sharp, size: 30.sp),
              ],
            ),

            //let’s take a short break for 5 minutes
            SizedBox(height: 51.h),
            Text(
              "let’s take a short break for 5 minutes",
              style: AppTextStyles.s20w5P(color: AppColors.black),
            ),

            // Timer and Progress Bar
            SizedBox(height: 26.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: 3.h,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.r),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 12.r),
                  activeTrackColor: Colors.black87,
                  inactiveTrackColor: Colors.black.withOpacity(0.2),
                  thumbColor: Colors.black87,
                  overlayColor: Colors.black.withOpacity(0.1),
                ),
                child: Slider(
                  value: progress,
                  onChanged: (value) {
                    setState(() {
                      currentSeconds = (value * totalSeconds).toInt();
                    });
                  },
                ),
              ),
            ),
            // Display current time in MM:SS format
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatTime(currentSeconds),
                    style: AppTextStyles.s16w5P(color: AppColors.black),
                  ),

                  Text(
                    _formatTime(totalSeconds),
                    style: AppTextStyles.s16w5P(color: AppColors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Don't forget to cancel the timer
    super.dispose();
  }
}
