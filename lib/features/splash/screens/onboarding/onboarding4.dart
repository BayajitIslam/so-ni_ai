import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/core/constants/image_const.dart';
import 'package:template/features/splash/widgets/onboarding_widget.dart';
import 'package:template/routes/routes_name.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingWidget(
        title: AppString.personalizedWorkoutPlan,
        imageUrl: AppImages.onboarding4,
        description: AppString.aiTailored,
        onNextTap: () => Get.offAllNamed(RoutesName.sigunUp),
      ),
    );
  }
}
