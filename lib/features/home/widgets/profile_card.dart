import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/themes/app_text_style.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.title,
    this.topTitle = "",
    this.topTitleDisable = false,
    this.rightIcon = Icons.arrow_forward_ios_rounded,
    this.leftIcon = Icons.logout,
    this.leftIconEnable = false,
    this.rightIconDisable = false,
    this.isProfile = false,
    this.isSwitchButtonEnable = false,
    this.iconSize = 16,
    this.radius = 5,
    this.onTap,
  });
  final String topTitle;
  final String title;
  final bool topTitleDisable;
  final bool leftIconEnable;
  final bool rightIconDisable;
  final IconData rightIcon;
  final IconData leftIcon;
  final bool isProfile;
  final bool isSwitchButtonEnable;
  final double iconSize;
  final double radius;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.yellowishLightOrange,
          borderRadius: BorderRadius.circular(radius.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
        margin: EdgeInsets.symmetric(vertical: 5.h),

        child: Row(
          children: [
            //Profile Logo
            isProfile
                ? CircleAvatar(
                    radius: 30.r,
                    backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    ),
                  )
                : SizedBox.shrink(),
            isProfile ? SizedBox(width: 13.w) : SizedBox.shrink(),

            //Right Sight Icon
            leftIconEnable
                ? Icon(leftIcon, size: 16.sp, color: AppColors.icon)
                : SizedBox.shrink(),
            leftIconEnable ? SizedBox(width: 10.w) : SizedBox.shrink(),

            //2 Title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                topTitleDisable
                    ? SizedBox.shrink()
                    : Text(
                        topTitle,
                        style: AppTextStyles.s14w5P(
                          color: AppColors.icon.withOpacity(0.8),
                        ),
                      ),

                //
                topTitleDisable ? SizedBox.shrink() : SizedBox(height: 10.h),
                //
                Text(title, style: AppTextStyles.s16w5I()),
              ],
            ),

            Spacer(),
            //Right Sight Icon
            rightIconDisable
                ? SizedBox.fromSize()
                : Icon(rightIcon, size: iconSize.sp, color: AppColors.icon),
            //Swtich BUtton
            isSwitchButtonEnable
                ? _swtichButton(true, (value) {})
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

//Swtich Button
Widget _swtichButton(final bool value, final Function(bool)? onChanged) {
  return GestureDetector(
    onTap: onChanged != null ? () => onChanged(!value) : null,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 52.w,
      height: 25.h,
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        color: value ? AppColors.icon : AppColors.fire,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: AnimatedAlign(
        duration: const Duration(milliseconds: 200),
        alignment: value ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          width: 19.25.w,
          height: 19.25.h,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    ),
  );
}
