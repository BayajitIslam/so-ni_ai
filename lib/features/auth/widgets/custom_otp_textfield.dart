// lib/features/auth/widgets/custom_otp_textfield.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart'; // Import AppColors

class CustomOtpTextField extends StatelessWidget {
  final int index;
  final Function(String) onChanged;

  const CustomOtpTextField({
    super.key,
    required this.index,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.w, // Width of each OTP input field
      height: 44.h, // Height of each OTP input field
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
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1, // Limit to one character per field
        onChanged: (value) {
          onChanged(value); // Pass entered value to parent widget
          if (value.isNotEmpty && index < 5) {
            FocusScope.of(
              context,
            ).nextFocus(); // Move to next field after input
          }
        },
        decoration: InputDecoration(
          counterText: '', // Hide the counter text
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor:
              AppColors.yellowishOrange, // Background color of the input field
        ),
      ),
    );
  }
}
