// lib/features/auth/screens/password_reset_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/translations.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/auth/controllers/password_reset_controller.dart';
import 'package:template/features/auth/widgets/custom_button.dart';
import 'package:template/features/auth/widgets/custome_textfield.dart'; // Assuming CustomTextField is your existing widget

class PasswordResetScreen extends StatelessWidget {
  PasswordResetScreen({super.key});

  // All Controller
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController newRePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Initialize the PasswordResetController
    final passwordResetController = Get.find<PasswordResetController>();

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
              SizedBox(height: 33.h),
              Text(AppString.passwordReset, style: AppTextStyles.s20w7I()),

              SizedBox(height: 17.h),
              // New Password TextField
              CustomTextField(
                controller: newPasswordController,
                hintText: AppString.enterNewPassword,
                icon: Icons.lock,
                obscureText: true,
                onChanged: (value) =>
                    passwordResetController.newPassword.value = value,
              ),

              SizedBox(height: 16.h),
              // Re-enter Password TextField
              CustomTextField(
                controller: newRePasswordController,
                hintText: AppString.reEnterNewPassword,
                icon: Icons.lock,
                obscureText: true,
                onChanged: (value) =>
                    passwordResetController.confirmPassword.value = value,
              ),
              SizedBox(height: 46.h),
              // Update Password Button
              CustomButton(
                title: AppString.updatePassword,
                onTap: () {
                  passwordResetController
                      .resetPassword(); // Call resetPassword method when tapped
                },
                textStyle: AppTextStyles.s14w4I(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
