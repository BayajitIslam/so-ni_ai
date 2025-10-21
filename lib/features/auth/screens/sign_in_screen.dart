// lib/features/auth/screens/sign_in_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/core/constants/my_icons.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/auth/controllers/sign_in_controller.dart';
import 'package:template/features/auth/widgets/custom_button.dart';
import 'package:template/features/auth/widgets/custome_textfield.dart';
import 'package:template/routes/routes_name.dart';

class SignInScreen extends StatelessWidget {
  // Initialize the GetX controller
  final SignInController signInController = Get.find<SignInController>();

  //all controller here
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInScreen({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 42.h),

              // Email TextField with GetX binding
              CustomTextField(
                controller: emailController,
                hintText: AppString.enterEmailAddress,
                icon: Icons.email,
                onChanged: (value) => signInController.email.value = value,
              ),
              // Password TextField with GetX binding
              CustomTextField(
                controller: passwordController,
                hintText: AppString.enterPassword,
                icon: MyIcons.lock,
                obscureText: true,
                onChanged: (value) => signInController.password.value = value,
              ),

              SizedBox(height: 8.h),
              // Forgot Password Link
              GestureDetector(
                onTap: () {
                  // Navigate to Reset Password screen
                  Get.toNamed(RoutesName.forgotPassword);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      AppString.forgotPassword,
                      style: AppTextStyles.s14w4I(color: AppColors.black),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 68.h),
              // Sign In Button with GetX action
              CustomButton(
                title: AppString.singIn,
                onTap: () {
                  signInController.signIn(); // Call sign-in method
                },
                textStyle: AppTextStyles.s14w4I(),
              ),

              SizedBox(height: 20.h),
              // Sign Up Button (navigate to SignUp screen)
              CustomButton(
                title: AppString.signUp,
                onTap: () => Get.toNamed(RoutesName.sigunUp),
                color: AppColors.buttonBg,
                textStyle: AppTextStyles.s14w4I(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
