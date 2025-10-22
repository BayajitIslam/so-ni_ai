import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/core/constants/app_colors.dart';

class AppTextStyles {
  //  lOGO SPLASH SCREEN ----------
  static TextStyle s48w4P({
    Color? color,
    double fontSize = 48,
    FontWeight fontweight = FontWeight.w400,
  }) {
    return GoogleFonts.poppins(
      color: color ?? AppColors.black,
      fontSize: fontSize.sp,
      fontWeight: fontweight,
      height: 1,
    );
  }

  //title
  static TextStyle s40w6P({
    Color? color,
    double fontSize = 40,
    FontWeight fontweight = FontWeight.w600,
  }) {
    return GoogleFonts.poppins(
      color: color ?? AppColors.icon,
      fontSize: fontSize.sp,
      fontWeight: fontweight,
      height: 1,
    );
  }

  //  Title ----------
  static TextStyle s20w6P({
    Color? color,
    double fontSize = 20,
    FontWeight fontweight = FontWeight.w600,
  }) {
    return GoogleFonts.poppins(
      color: color ?? AppColors.white,
      fontSize: fontSize.sp,
      fontWeight: fontweight,
      height: 1,
    );
  }

  //  Title ----------
  static TextStyle s20w5P({
    Color? color,
    double fontSize = 20,
    FontWeight fontweight = FontWeight.w500,
  }) {
    return GoogleFonts.poppins(
      color: color ?? AppColors.white,
      fontSize: fontSize.sp,
      fontWeight: fontweight,
      height: 1,
    );
  }

  //  Title ----------
  static TextStyle s24w6I({
    Color? color,
    double fontSize = 24,
    FontWeight fontweight = FontWeight.w600,
  }) {
    return GoogleFonts.inter(
      color: color ?? AppColors.white,
      fontSize: fontSize.sp,
      fontWeight: fontweight,
      height: 1,
    );
  }

  //  Title ----------
  static TextStyle s24w6P({
    Color? color,
    double fontSize = 24,
    FontWeight fontweight = FontWeight.w600,
  }) {
    return GoogleFonts.poppins(
      color: color ?? AppColors.icon,
      fontSize: fontSize.sp,
      fontWeight: fontweight,
      height: 1,
    );
  }

  //  Title ----------
  static TextStyle s24w5P({
    Color? color,
    double fontSize = 24,
    FontWeight fontweight = FontWeight.w500,
  }) {
    return GoogleFonts.poppins(
      color: color ?? AppColors.icon,
      fontSize: fontSize.sp,
      fontWeight: fontweight,
      height: 1,
      letterSpacing: -1.58,
    );
  }

  //  body ----------
  static TextStyle s16w5P({
    Color? color,
    double fontSize = 16,
    FontWeight fontweight = FontWeight.w500,
  }) {
    return GoogleFonts.poppins(
      color: color ?? AppColors.white,
      fontSize: fontSize.sp,
      fontWeight: fontweight,
      height: 1,
    );
  }

  //  body ----------
  static TextStyle s13w4P({
    Color? color,
    double fontSize = 13,
    FontWeight fontweight = FontWeight.w400,
  }) {
    return GoogleFonts.poppins(
      color: color ?? AppColors.white,
      fontSize: fontSize.sp,
      fontWeight: fontweight,
      height: 1,
    );
  }

  static TextStyle s26w5P({
    Color? color,
    double fontSize = 26,
    FontWeight fontweight = FontWeight.w500,
  }) {
    return GoogleFonts.poppins(
      color: color ?? AppColors.white,
      fontSize: fontSize.sp,
      fontWeight: fontweight,
      height: 1,
    );
  }

  static TextStyle s22w4P({
    Color? color,
    double fontSize = 22,
    FontWeight fontweight = FontWeight.w400,
  }) {
    return GoogleFonts.poppins(
      color: color ?? AppColors.icon,
      fontSize: fontSize.sp,
      fontWeight: fontweight,
      height: 1,
      letterSpacing: -0.95,
    );
  }

  //  body ----------
  static TextStyle s16w4I({
    Color? color,
    double fontSize = 16,
    FontWeight fontweight = FontWeight.w400,
  }) {
    return GoogleFonts.inter(
      color: color ?? AppColors.white,
      fontSize: fontSize.sp,
      fontWeight: fontweight,
      height: 1,
    );
  }

  //  body ----------
  static TextStyle s12w5I({
    Color? color,
    double fontSize = 12,
    FontWeight fontweight = FontWeight.w500,
  }) {
    return GoogleFonts.inter(
      color: color ?? AppColors.white,
      fontSize: fontSize.sp,
      fontWeight: fontweight,
      height: 1,
    );
  }

  //  body ----------
  static TextStyle s20w7I({
    Color? color,
    double fontSize = 20,
    FontWeight fontweight = FontWeight.w700,
  }) {
    return GoogleFonts.inter(
      color: color ?? AppColors.brandText,
      fontSize: fontSize.sp,
      fontWeight: fontweight,
      height: 1,
    );
  }

  //  body ----------
  static TextStyle s14w4I({
    Color? color,
    double fontSize = 14,
    FontWeight fontweight = FontWeight.w400,
  }) {
    return GoogleFonts.inter(
      color: color ?? AppColors.whiteText,
      fontSize: fontSize.sp,
      fontWeight: fontweight,
      height: 1,
    );
  }

  //  appbar ----------
  static TextStyle s32w5P({
    Color? color,
    double fontSize = 32,
    FontWeight fontweight = FontWeight.w500,
  }) {
    return GoogleFonts.poppins(
      color: color ?? AppColors.black,
      fontSize: fontSize.sp,
      fontWeight: fontweight,
      height: 1,
    );
  }
}
