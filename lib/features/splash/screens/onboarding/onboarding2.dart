import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/core/constants/image_const.dart';
import 'package:template/features/splash/widgets/onboarding_widget.dart';
import 'package:template/routes/routes_name.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingWidget(
        title: AppString.aiPowerdModelRecommend,
        imageUrl: AppImages.onboarding2,
        description: AppString.getPersonalized,
        onNextTap: () => Get.toNamed(RoutesName.onboarding3),
      ),
    );
  }
}
