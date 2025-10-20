// lib/widgets/custom_text_field.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/themes/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final Function(String) onChanged;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.1), // Shadow color with opacity
              offset: Offset(0, 4), // Shadow position
              blurRadius: 8, // Blur effect for the shadow
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: AppColors.black, size: 18.sp),
            filled: true,
            fillColor:
                AppColors.yellowishOrange, // Light background for text field
            hintText: hintText,
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
    );
  }
}
