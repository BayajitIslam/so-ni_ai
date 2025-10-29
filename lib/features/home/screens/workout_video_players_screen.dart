import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/themes/app_text_style.dart';

class WorkoutVideoPlayerScreen extends StatefulWidget {
  const WorkoutVideoPlayerScreen({super.key});

  @override
  State<WorkoutVideoPlayerScreen> createState() =>
      _WorkoutVideoPlayerScreenState();
}

class _WorkoutVideoPlayerScreenState extends State<WorkoutVideoPlayerScreen> {
  bool isPlaying = false;
  int currentSeconds = 0; // 02:15
  int totalSeconds = 180; // 03:00
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;
    });

    if (isPlaying) {
      _startTimer();
    } else {
      _timer?.cancel();
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentSeconds < totalSeconds) {
        setState(() {
          currentSeconds++;
        });
      } else {
        _timer?.cancel();
        setState(() {
          isPlaying = false;
        });
      }
    });
  }

  void _skipForward() {
    setState(() {
      currentSeconds = (currentSeconds + 10).clamp(0, totalSeconds);
    });
  }

  void _skipBackward() {
    setState(() {
      currentSeconds = (currentSeconds - 10).clamp(0, totalSeconds);
    });
  }

  String _formatTime(int seconds) {
    int mins = seconds ~/ 60;
    int secs = seconds % 60;
    return '${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    double progress = currentSeconds / totalSeconds;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Video Background (Replace with actual video player)
          Positioned.fill(
            child: Image.asset('assets/images/gym_man.jpg', fit: BoxFit.cover),
          ),

          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Controls
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              decoration: BoxDecoration(
                color: AppColors.yellowishLightOrange,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Current Time
                  Text(
                    _formatTime(currentSeconds),
                    style: AppTextStyles.s32w5P(),
                  ),
                  SizedBox(height: 16.h),

                  // Progress Bar
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  _formatTime(totalSeconds),
                                  style: AppTextStyles.s16w5P(
                                    color: AppColors.black,
                                  ),
                                ),

                                //total time text
                                Text(
                                  "Total Time",
                                  style: AppTextStyles.s13w4P(
                                    fontSize: 10,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //progress bar timer
                      SliderTheme(
                        data: SliderThemeData(
                          trackHeight: 2.h,
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 6.r,
                          ),
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 12.r,
                          ),
                          activeTrackColor: Colors.black87,
                          inactiveTrackColor: Colors.black.withOpacity(0.2),
                          thumbColor: Colors.black87,
                          overlayColor: Colors.black.withOpacity(0.1),
                        ),
                        child: Slider(
                          value: progress,
                          min: 0.0,
                          max: 1.0,
                          onChanged: (value) {
                            setState(() {
                              currentSeconds = (value * totalSeconds).toInt();
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  // Control Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Previous Button
                      _buildControlButton(label: 'Prev', onTap: _skipBackward),
                      SizedBox(width: 24.w),

                      // Play/Pause Button
                      GestureDetector(
                        onTap: _togglePlayPause,
                        child: Container(
                          width: 44.w,
                          height: 44.w,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                            size: 32.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 24.w),

                      // Next Button
                      _buildControlButton(label: 'Next', onTap: _skipForward),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
