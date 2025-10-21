import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/core/constants/image_const.dart';
import 'package:template/features/splash/widgets/onboarding_widget.dart';
import 'package:template/routes/routes_name.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingWidget(
        title: AppString.smartMealDiary,
        imageUrl: AppImages.onboarding3,
        description: AppString.logYourDailyMeals,
        onNextTap: () => Get.toNamed(RoutesName.onboarding4),
      ),
    );
  }
}
