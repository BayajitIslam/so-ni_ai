import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/home/widgets/profile_card.dart';
import 'package:template/routes/routes_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(24.dg),
          children: [
            //Profile Card
            ProfileCard(
              topTitleDisable: true,
              title: "Jon Mayer",
              isProfile: true,
              rightIcon: Icons.notifications_outlined,
              iconSize: 24,
              radius: 11,
            ),

            SizedBox(height: 20.h),
            //Personal Inforamtion Text
            Text("Personal Information", style: AppTextStyles.s16w6I()),

            SizedBox(height: 8.h),
            //Gender
            ProfileCard(
              title: "Male",
              topTitle: "Gender",
              onTap: () => Get.toNamed(
                RoutesName.genderSelection,
                arguments: 'back_to_profile',
              ),
            ),
            //Age
            ProfileCard(
              title: "32 Years Old",
              topTitle: "Age",
              onTap: () => Get.toNamed(
                RoutesName.ageSelection,
                arguments: 'back_to_profile',
              ),
            ),
            //Height
            ProfileCard(
              title: "180 cm",
              topTitle: "Height",
              onTap: () => Get.toNamed(
                RoutesName.heightSelection,
                arguments: 'back_to_profile',
              ),
            ),
            //Weight
            ProfileCard(
              title: "75 Kg",
              topTitle: "Weight",
              onTap: () => Get.toNamed(
                RoutesName.weighttSelection,
                arguments: 'back_to_profile',
              ),
            ),

            SizedBox(height: 11.h),
            //Goald And Preferences Text
            Text("Goals and Preferences", style: AppTextStyles.s16w6I()),

            SizedBox(height: 8.h),
            // Goal
            ProfileCard(
              title: "Weight loss",
              topTitle: "Goal",
              onTap: () => Get.toNamed(
                RoutesName.genderSelection,
                arguments: 'back_to_profile',
              ),
            ),
            //Dietary  Restriction
            ProfileCard(title: "Allergies", topTitle: "Dietary Restriction"),

            //Height
            ProfileCard(
              title: "180 cm",
              topTitle: "Height",
              onTap: () => Get.toNamed(
                RoutesName.heightSelection,
                arguments: 'back_to_profile',
              ),
            ),

            //alergies Nuts
            ProfileCard(title: "Nuts", topTitle: "Allergies"),

            SizedBox(height: 11.h),
            //App Setting
            Text("App Settings", style: AppTextStyles.s16w6I()),

            SizedBox(height: 8.h),
            //Language
            ProfileCard(
              title: "Language",
              topTitle: "back",
              topTitleDisable: true,
              onTap: () => Get.toNamed(
                RoutesName.languageSelection,
                arguments: 'back_to_profile',
              ),
            ),

            //Notification
            ProfileCard(
              title: "Notification",
              topTitleDisable: true,
              rightIconDisable: true,
              isSwitchButtonEnable: true,
            ),

            //Privacy And Policy
            ProfileCard(
              title: "Privacy and Policy",
              topTitleDisable: true,
              onTap: () => Get.toNamed(RoutesName.privacyPolicyScreen),
            ),

            //Logout
            ProfileCard(
              title: "Logout",
              topTitleDisable: true,
              rightIconDisable: true,
              leftIconEnable: true,
            ),
          ],
        ),
      ),
    );
  }
}
