// lib/features/auth/screens/otp_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/translations.dart';
import 'package:template/core/themes/app_text_style.dart';

import 'package:template/features/auth/controllers/otp_controller.dart';
import 'package:template/features/auth/widgets/custom_button.dart';
import 'package:template/features/auth/widgets/custom_otp_textfield.dart';

class VerifyOtpScreen extends StatelessWidget {
  VerifyOtpScreen({super.key});

  //email argumnet
  final String email = Get.arguments;

  @override
  Widget build(BuildContext context) {
    // Initialize the OTP controller
    final otpController = Get.find<OtpController>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: CircleAvatar(
              backgroundColor: AppColors.buttonBg,
              child: Icon(Icons.arrow_back, color: AppColors.white),
            ),
          ),
        ),
        title: Text(AppString.soni, style: AppTextStyles.s32w5P()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 37.h),
              Text(AppString.checkYourEmail, style: AppTextStyles.s20w7I()),
              SizedBox(height: 10.h),
              Text(
                '${AppString.weSentCode} $email. ${AppString.enter6digitCose}.',
                style: AppTextStyles.s16w4I(color: AppColors.icon),
              ),
              SizedBox(height: 47.h),
              // OTP Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 54.w,
                    height: 54.h,

                    //Text Field
                    child: CustomOtpTextField(
                      index: index,
                      onChanged: (value) {
                        otpController.otp[index].value = value;
                      },
                    ),
                  );
                }),
              ),
              SizedBox(height: 24.h),
              // Verify Code Button
              CustomButton(
                title: AppString.veryfyCode,
                onTap: () {
                  otpController
                      .verifyOtp(); // Call verifyOtp method when tapped
                },
                textStyle: AppTextStyles.s14w4I(),
              ),
              SizedBox(height: 24.h),
              // Resend Email Option
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppString.haventgotEmail,
                    style: AppTextStyles.s14w4I(color: AppColors.black),
                  ),

                  SizedBox(width: 3.w),
                  GestureDetector(
                    onTap: () {
                      otpController.resendOtp(); // Call resendOtp when tapped
                    },
                    child: Text(
                      AppString.resendEmail,
                      style: AppTextStyles.s14w4I(color: AppColors.brandText),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
