import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/translations.dart';
import 'package:template/core/constants/image_const.dart';
import 'package:template/features/splash/widgets/onboarding_widget.dart';
import 'package:template/routes/routes_name.dart';

class Onbaording1 extends StatelessWidget {
  const Onbaording1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingWidget(
        title: AppString.smartFoodScanner,
        imageUrl: AppImages.onboarding1,
        description: AppString.instantlyAnalize,
        onNextTap: () => Get.toNamed(RoutesName.onboarding2),
      ),
    );
  }
}
