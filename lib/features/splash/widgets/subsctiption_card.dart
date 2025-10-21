import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/themes/app_text_style.dart';

class SubscriptionCard extends StatelessWidget {
  final String title;
  final String price;
  final bool isSelected;
  final String? badge;

  const SubscriptionCard({
    super.key,
    required this.title,
    required this.price,
    required this.isSelected,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 172.w,
          height: 94.h,
          decoration: BoxDecoration(
            color: AppColors.yellowishOrange,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: isSelected
                  ? AppColors.brandBorder
                  : AppColors.black.withOpacity(0.40),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.s16w5P(color: AppColors.greyNormal),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: AppTextStyles.s16w5P(color: AppColors.greyNormal),
                  ),
                ],
              ),

              // Radio Button
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.brandBorder
                        : AppColors.brandBorder,
                    width: 1,
                  ),
                  color: isSelected
                      ? AppColors.brandBorder
                      : Colors.transparent,
                ),
                child: isSelected
                    ? Center(
                        child: Icon(
                          Icons.check,
                          size: 16,
                          color: AppColors.yellowishOrange,
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
        // Badge
        if (badge != null)
          Positioned(
            top: -10,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.buttonBg,
                  borderRadius: BorderRadius.circular(23.r),
                ),
                child: Text(badge!, style: AppTextStyles.s12w5I()),
              ),
            ),
          ),
      ],
    );
  }
}
