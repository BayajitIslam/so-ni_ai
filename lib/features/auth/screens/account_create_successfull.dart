// lib/features/auth/screens/otp_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/translations.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/auth/widgets/custom_button.dart';
import 'package:template/routes/routes_name.dart';

class AccountCreateSuccessfull extends StatelessWidget {
  AccountCreateSuccessfull({super.key});

  //argument
  final argument = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 90.h),
            Text(argument, style: AppTextStyles.s20w7I()),
            SizedBox(height: 10.h),
            Text(
              AppString.yourAccounthasBeenCreated,
              textAlign: TextAlign.center,
              style: AppTextStyles.s14w4I(color: AppColors.black),
            ),
            SizedBox(height: 47.h),

            //  Button
            CustomButton(
              title: AppString.singIn,
              textStyle: AppTextStyles.s14w4I(),
              onTap: () => Get.toNamed(RoutesName.signin),
            ),
          ],
        ),
      ),
    );
  }
}
