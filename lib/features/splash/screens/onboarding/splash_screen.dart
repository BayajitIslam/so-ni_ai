import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/splash/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  //Getx Inject

  final SplashController splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(AppString.soni, style: AppTextStyles.s48w4P())),
    );
  }
}
