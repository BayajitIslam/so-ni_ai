import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/auth/widgets/custom_button.dart';
import 'package:template/routes/routes_name.dart';

class HeightSelectionScreen extends StatelessWidget {
  const HeightSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 46.h),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              //TITLE
              Center(
                child: Text(
                  AppString.whatsYourHeight,
                  style: AppTextStyles.s24w6I(color: AppColors.brandText),
                ),
              ),
              //HEIGHT DATA

              //CONTINUE BUTTON
              Spacer(),
              CustomButton(
                title: AppString.continuee,
                textStyle: AppTextStyles.s16w5P(),
                onTap: () => Get.toNamed(RoutesName.weighttSelection),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
