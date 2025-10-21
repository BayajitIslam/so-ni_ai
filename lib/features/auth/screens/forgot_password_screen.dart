// lib/features/auth/screens/forgot_password_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/auth/controllers/forgot_password_controller.dart';
import 'package:template/features/auth/widgets/custom_button.dart';
import 'package:template/features/auth/widgets/custome_textfield.dart';
import 'package:template/routes/routes_name.dart';

class ForgotPasswordScreen extends StatelessWidget {
  // Initialize the GetX controller
  final ForgotPasswordController forgotPasswordController =
      Get.find<ForgotPasswordController>();

  //email controller
  final TextEditingController emailController = TextEditingController();

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 62.h),

              // Title
              Text(AppString.forgotPassword, style: AppTextStyles.s20w7I()),

              // Sub Title
              SizedBox(height: 5.h),
              Text(
                AppString.pleaseEnterYourEmail,
                style: AppTextStyles.s14w4I(color: AppColors.black),
              ),

              SizedBox(height: 47.h),
              // Email TextField with GetX binding
              CustomTextField(
                controller: emailController,
                hintText: AppString.enterEmailAddress,
                icon: Icons.email,
                onChanged: (value) =>
                    forgotPasswordController.email.value = value,
              ),

              SizedBox(height: 24.h),
              // Reset Password Button with GetX action
              CustomButton(
                title: AppString.resetPassword,
                onTap: () {
                  Get.toNamed(
                    RoutesName.otpScreen,
                    arguments: emailController.text,
                  );
                  forgotPasswordController
                      .resetPassword(); // Call resetPassword method
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
