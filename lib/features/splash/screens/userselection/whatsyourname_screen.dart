import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/auth/widgets/custom_button.dart';
import 'package:template/routes/routes_name.dart';

class WhatsyournameScreen extends StatelessWidget {
  WhatsyournameScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 46.h),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  AppString.whatsYourHeight,
                  style: AppTextStyles.s24w6I(color: AppColors.brandText),
                ),
              ),

              SizedBox(height: 46.h), // Increased spacing after title
              // Age Selection Custom Widget
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors
                          .yellowishOrange, // Light background for text field
                      hintText: AppString.yourName,
                      hintStyle: AppTextStyles.s14w4I(
                        color: AppColors.black,
                      ), // Hint text styling from AppTextStyles
                      // Removing the border and adding a drop shadow effect
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide.none,
                      ),
                      // Adding drop shadow using the boxDecoration
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16.h,
                        horizontal: 20.w,
                      ),
                    ),
                  ),
                ),
              ),

              Spacer(),

              // CONTINUE BUTTON
              CustomButton(
                title: AppString.continuee,
                textStyle: AppTextStyles.s16w5P(),
                onTap: () {
                  print('Name: ${controller.text}');
                  Get.offAllNamed(RoutesName.genderSelection);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
