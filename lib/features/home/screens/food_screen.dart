import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/my_icons.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/auth/widgets/custom_button.dart';
import 'package:template/routes/routes_name.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF3D3AD),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,

            //image here
            children: [
              SizedBox(
                height: 351.h,
                child: Image.asset("assets/images/demoOnly.png"),
              ),
              //container here
              Positioned(
                top: 299.h,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0XFFF3D3AD),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.r),
                      topRight: Radius.circular(50.r),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 23.w,
                    vertical: 39.h,
                  ),
                  //Colum
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.yellowishLightOrange,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
                                  blurRadius: 10,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            height: 100.h,
                            width: 178.w,
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Calories",
                                  style: AppTextStyles.s20w5P(
                                    color: AppColors.icon,
                                  ),
                                ),
                                Text(
                                  "2,230 kcal",
                                  style: AppTextStyles.s16w5P(
                                    fontSize: 18,
                                    color: AppColors.brandText,
                                    fontweight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //
                          _buildProgressCard(
                            title: 'Protein',
                            currentValue: 83,
                            totalValue: 100,
                          ),
                        ],
                      ),
                      SizedBox(height: 13.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildProgressCard(
                            title: 'Carbs',
                            currentValue: 83,
                            totalValue: 100,
                          ),

                          _buildProgressCard(
                            title: 'Fat',
                            currentValue: 83,
                            totalValue: 100,
                          ),
                        ],
                      ),
                      _buildFoodItemCard(
                        title: 'Grilled Chicken Strips',
                        kcal: 220,
                        protein: 30,
                        carbs: 0,
                        fat: 6,
                      ),
                      _buildFoodItemCard(
                        title: 'Naan Bread',
                        kcal: 280,
                        protein: 7,
                        carbs: 45,
                        fat: 0,
                      ),
                      _buildFoodItemCard(
                        title: 'Sautéed Bell Peppers (Red & Yellow)',
                        kcal: 50,
                        protein: 1,
                        carbs: 12,
                        fat: 0.3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          //Button
          Spacer(),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            child: CustomButton(
              radius: 12,
              verticlePadding: 14,
              textStyle: AppTextStyles.s16w5P(),
              title: "Add Diary",
              onTap: () => _showMealTimePopup(context),
            ),
          ),
          SizedBox(height: 38.h),
        ],
      ),
    );
  }
}

// Progress Card Method
Widget _buildProgressCard({
  required String title,
  required int currentValue,
  required int totalValue,
  Color progressColor = AppColors.brandBorder,
  Color backgroundColor = const Color(0xFFE8D5C4),
}) {
  double percentage = (currentValue / totalValue) * 100;

  return Container(
    decoration: BoxDecoration(
      color: AppColors.yellowishLightOrange,
      borderRadius: BorderRadius.circular(10.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 10,
          offset: Offset(0, 2),
        ),
      ],
    ),
    height: 100.h,
    width: 178.w,
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(title, style: AppTextStyles.s20w5P(color: AppColors.icon)),
        SizedBox(height: 12.h),

        // Progress Bar
        Stack(
          children: [
            // Background Bar
            Container(
              height: 6.h,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            // Progress Bar
            FractionallySizedBox(
              widthFactor: currentValue / totalValue,
              child: Container(
                height: 6.h,
                decoration: BoxDecoration(
                  color: progressColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),

        // Percentage Values
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${percentage.toStringAsFixed(0)}%',
              style: AppTextStyles.s14w4I(color: AppColors.icon),
            ),
            Text('100%', style: AppTextStyles.s14w4I(color: AppColors.icon)),
          ],
        ),
      ],
    ),
  );
}

// Food Item Card Method
Widget _buildFoodItemCard({
  required String title,
  required int kcal,
  required num protein,
  required num carbs,
  required num fat,
}) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
    decoration: BoxDecoration(
      color: AppColors.yellowishLightOrange,
      borderRadius: BorderRadius.circular(10.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 10,
          offset: Offset(0, 2),
        ),
      ],
    ),
    margin: EdgeInsets.only(top: 15.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(title, style: AppTextStyles.s16w4P(color: AppColors.icon)),
        SizedBox(height: 8.h),

        // Nutrition Info
        SizedBox(height: 14.h),
        Text(
          '$kcal kcal | Protein: ${_formatNumber(protein)}g | Carbs: ${_formatNumber(carbs)}g | Fat: ${_formatNumber(fat)}g',
          style: AppTextStyles.s13w4P(color: AppColors.black.withOpacity(0.8)),
        ),
      ],
    ),
  );
}

// Helper method to format numbers (remove .0 for whole numbers)
String _formatNumber(num value) {
  if (value == value.toInt()) {
    return value.toInt().toString();
  }
  return value.toString();
}

void _showMealTimePopup(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Meal Time',
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, anim1, anim2) {
      return const SizedBox.shrink();
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: anim1, curve: Curves.easeOutCubic)),
        child: Align(
          alignment: Alignment.centerRight,
          child: FadeTransition(opacity: anim1, child: const MealTimePopup()),
        ),
      );
    },
  );
}

class MealTimePopup extends StatefulWidget {
  const MealTimePopup({super.key});

  @override
  State<MealTimePopup> createState() => _MealTimePopupState();
}

class _MealTimePopupState extends State<MealTimePopup> {
  String? selectedMeal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 351.h,
      decoration: const BoxDecoration(
        color: AppColors.yellowishLightOrange,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      margin: EdgeInsets.symmetric(horizontal: 21.w),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'When Did You Eat This?',
                style: AppTextStyles.s16w5P(color: AppColors.black),
              ),
              SizedBox(height: 19),
              _buildMealButton('Breakfast'),
              SizedBox(height: 13.h),
              _buildMealButton('Lunch'),
              SizedBox(height: 13.h),
              _buildMealButton('Dinner'),
              SizedBox(height: 13.h),
              _buildMealButton('Snacks'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMealButton(String mealName) {
    return GestureDetector(
      onTap: () {
        //after select show successfull message and rout to another pages
        Navigator.pop(context);

        showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel: 'Meal Time',
          barrierColor: Colors.black54,
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, anim1, anim2) {
            return const SizedBox.shrink();
          },
          transitionBuilder: (context, anim1, anim2, child) {
            return SlideTransition(
              position:
                  Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(parent: anim1, curve: Curves.easeOutCubic),
                  ),
              child: Align(
                alignment: Alignment.centerRight,
                child: FadeTransition(
                  opacity: anim1,
                  child: Material(
                    color: Colors.transparent,

                    child: Container(
                      width: double.infinity,
                      height: 159.h,
                      decoration: BoxDecoration(
                        color: AppColors.brand,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 25.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(MyIcons.ai),
                              SizedBox(width: 8.w),
                              Text(
                                'great! you’ve Added This On Diary',
                                style: AppTextStyles.s16w5P(
                                  color: AppColors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          CustomButton(
                            textStyle: AppTextStyles.s16w4P(),
                            verticlePadding: 16,
                            title: "Continue",
                            onTap: () {
                              Get.offAllNamed(RoutesName.diaryScreen);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 90.w),
        decoration: BoxDecoration(
          color: AppColors.buttonBg,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(MyIcons.eat, color: AppColors.icon, size: 20),
            ),
            SizedBox(width: 28.w),
            Text(
              mealName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
