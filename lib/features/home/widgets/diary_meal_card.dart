import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/my_icons.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/auth/widgets/custom_button.dart';

class DiaryMealCard extends StatelessWidget {
  const DiaryMealCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.yellowishLightOrange,
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.5.h),
      child: Column(
        children: [
          //icon and name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //icon
              CircleAvatar(
                radius: 25.r,
                backgroundColor: AppColors.white,
                child: Icon(MyIcons.eat, color: AppColors.icon, size: 22.sp),
              ),

              //name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Breackfast", style: AppTextStyles.s16w6M()),
                  SizedBox(height: 5.h),
                  Text("420 kcal", style: AppTextStyles.s14w5M()),
                ],
              ),
            ],
          ),
          //
          SizedBox(height: 10.h),
          _buildEatingRow("Apple"),
          _buildEatingRow("Almonds (20g)"),
          _buildEatingRow("Black coffee"),

          SizedBox(height: 10.h),
          //change meal button
          CustomButton(
            title: "Change Meal",
            verticlePadding: 14,
            radius: 25,
            textStyle: AppTextStyles.s14w5P(),

            onTap: () {},
          ),
        ],
      ),
    );
  }
}

//
Widget _buildEatingRow(String name) {
  return Row(
    children: [
      Container(
        width: 3.w,
        height: 3.h,
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(111.r),
        ),
        margin: EdgeInsets.only(left: 8),
      ),

      SizedBox(width: 8.w),
      Text(name, style: AppTextStyles.s16w5M()),
      Spacer(),
      Icon(Icons.delete_outline),
    ],
  );
}
