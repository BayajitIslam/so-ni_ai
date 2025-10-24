import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/auth/widgets/custom_button.dart';
import 'package:template/features/splash/controllers/subscription_controller.dart';
import 'package:template/features/splash/widgets/subsctiption_card.dart';
import 'package:template/features/splash/widgets/trail_timeline_widget.dart';
import 'package:template/routes/routes_name.dart';

class SubscriptionPage extends StatelessWidget {
  SubscriptionPage({super.key});

  // GetX Controller
  final SubscriptionController controller = Get.find<SubscriptionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.offAllNamed(RoutesName.profileReady),
          child: Icon(Icons.close, color: AppColors.black, size: 24.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Heading text
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
                child: Text(
                  AppString.startYour3dayFreeTrailToContinue,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.s26w5P(color: AppColors.black),
                ),
              ),

              // Trial Information Section
              SizedBox(height: 54.h),
              TrialTimeline(),
              SizedBox(height: 67.h),

              // Subscription options with Obx for reactive state
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => controller.selectPlan('Monthly'),
                        child: SubscriptionCard(
                          title: AppString.monthly,
                          price: AppString.mo199,
                          isSelected:
                              controller.selectedPlan.value == 'Monthly',
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => controller.selectPlan('Yearly'),
                        child: SubscriptionCard(
                          title: AppString.yearly,
                          price: AppString.mo099,
                          isSelected: controller.selectedPlan.value == 'Yearly',
                          badge: AppString.dayfree3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Payment Due Text
              Padding(
                padding: EdgeInsets.only(top: 28.h, bottom: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check, color: AppColors.black),
                    SizedBox(width: 10.w),
                    Text(
                      AppString.noPaymentDueNow,
                      style: AppTextStyles.s16w5P(color: AppColors.black),
                    ),
                  ],
                ),
              ),

              CustomButton(
                textStyle: AppTextStyles.s20w5P(),
                title: AppString.start3dayFreeTrial,
                onTap: () {
                  // Access selected plan
                  print('Selected Plan: ${controller.selectedPlan.value}');
                  Get.toNamed(RoutesName.profileReady);
                },
              ),

              // Below Info Text
              Padding(
                padding: EdgeInsets.only(top: 19.h),
                child: Text(
                  AppString.daysFreeThen,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.s16w4I(color: AppColors.icon),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for displaying each trial info (Today, Day 2, After Day 3)
}
