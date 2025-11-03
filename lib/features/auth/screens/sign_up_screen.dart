import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/translations.dart';
import 'package:template/core/constants/my_icons.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/auth/controllers/otp_controller.dart';
import 'package:template/features/auth/controllers/sign_up_controller.dart';

import 'package:template/features/auth/widgets/custom_button.dart';
import 'package:template/features/auth/widgets/custome_textfield.dart';
import 'package:template/routes/routes_name.dart';

class SignUpScreen extends StatelessWidget {
  // Initialize the GetX controller
  final SignUpController signUpController = Get.find<SignUpController>();

  //AllController Here
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        elevation: 0,
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
              // Full Name TextField with GetX binding
              CustomTextField(
                controller: fullNameController,
                hintText: AppString.enterfullName,
                icon: MyIcons.navUser,
                onChanged: (value) => signUpController.fullName.value = value,
              ),
              // Email TextField with GetX binding
              CustomTextField(
                controller: emailController,
                hintText: AppString.enterEmailAddress,
                icon: Icons.email,
                onChanged: (value) => signUpController.email.value = value,
              ),
              // Mobile Number TextField with GetX binding
              CustomTextField(
                controller: mobileNumberController,
                hintText: AppString.enterMobileNumber,
                icon: Icons.phone,
                onChanged: (value) =>
                    signUpController.mobileNumber.value = value,
              ),
              // Password TextField with GetX binding
              CustomTextField(
                controller: passwordController,
                hintText: AppString.enterPassword,
                icon: MyIcons.lock,
                obscureText: true,
                onChanged: (value) => signUpController.password.value = value,
              ),
              // Re-enter Password TextField with GetX binding
              CustomTextField(
                controller: rePasswordController,
                hintText: AppString.reEnterPassword,
                icon: MyIcons.lock,
                obscureText: true,
                onChanged: (value) => signUpController.rePassword.value = value,
              ),

              SizedBox(height: 55.h),
              // Sign Up Button with GetX action
              CustomButton(
                title: AppString.signUp,
                onTap: () {
                  final otpController = Get.find<OtpController>();
                  otpController.setFlow(
                    false,
                  ); // Set the flow to forgot password
                  signUpController.signUp();

                  Get.toNamed(
                    RoutesName.verifyotpScreen,
                    arguments: emailController.text,
                  );
                },
                textStyle: AppTextStyles.s14w4I(),
              ),

              SizedBox(height: 20.h),
              CustomButton(
                title: AppString.singIn,
                onTap: () => Get.toNamed(RoutesName.signin),
                textStyle: AppTextStyles.s14w4I(),
              ),

              // Sign In Button
            ],
          ),
        ),
      ),
    );
  }
}
