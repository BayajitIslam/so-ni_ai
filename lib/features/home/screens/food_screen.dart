import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/auth/widgets/custom_button.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0XFFF3D3AD),
      body: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.passthrough,
        children: [
          SizedBox(
            height: 351.h,
            child: Image.asset("assets/images/demoOnly.png"),
          ),
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
              padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 39.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          //
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
                        ],
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
                  //Button
                  SizedBox(height: 15),
                  Column(
                    children: [
                      CustomButton(
                        radius: 12,
                        verticlePadding: 14,
                        textStyle: AppTextStyles.s16w5P(),
                        title: "Add Diary",
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
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
