import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.textStyle,
    this.color = AppColors.buttonBg,
    this.verticlePadding = 18,
    this.radius = 30,
    this.isBorderEnable = false,
  });

  final String title;
  final Color color;
  final void Function()? onTap;
  final TextStyle? textStyle;
  final double verticlePadding;
  final double radius;
  final bool isBorderEnable;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius.r),
          border: Border.all(
            color: isBorderEnable ? AppColors.brandBorder : Colors.transparent,

            width: isBorderEnable ? 1 : 0,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: verticlePadding.h),
        child: Center(child: Text(title, style: textStyle)),
      ),
    );
  }
}
