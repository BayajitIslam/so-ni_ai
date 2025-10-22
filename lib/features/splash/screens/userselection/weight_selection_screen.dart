import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// PLACEHOLDERS: Replace with your actual imports
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/auth/widgets/custom_button.dart';
import 'package:template/features/splash/controllers/measurement_controller.dart';
import 'package:template/features/splash/widgets/measurement_picker.dart';
import 'package:template/routes/routes_name.dart';

class WeightSelectionScreen extends StatelessWidget {
  WeightSelectionScreen({super.key});

  // Finds the controller instance (assumes it was created in HeightScreen or binding)
  final MeasurementController measurementController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 46.h),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Center(
                // Use your app string for the title
                child: Text(
                  AppString.whatsYourWeight,
                  style: AppTextStyles.s24w6I(color: AppColors.brandText),
                ),
              ),

              SizedBox(height: 20.h),

              // UNIT TOGGLE SEGMENT (KGs / LBS)
              _buildUnitToggle(
                isMetric: measurementController.isMetricWeight,
                metricTitle: 'kgs',
                imperialTitle: 'lbs',
                onToggle: measurementController.toggleWeightUnit,
              ),

              SizedBox(height: 20.h),

              // WEIGHT DATA PICKER
              Expanded(
                child: Obx(() {
                  final bool isKGs = measurementController.isMetricWeight.value;

                  // Dynamic parameters for the picker
                  final String unit = isKGs ? 'kgs' : 'lbs';
                  final List<int> mainItems = isKGs
                      ? List<int>.generate(61, (i) => 40 + i) // KGs: 40 to 100
                      : List<int>.generate(
                          121,
                          (i) => 88 + i,
                        ); // LBS: ~88 to 208
                  final int initialMainValue = isKGs ? 70 : 154;

                  // Weight is simple, no decimal wheel is needed
                  final List<int> decimalItems = const [];
                  final int initialDecimalValue = 0;

                  return MeasurementPicker(
                    unit: unit,
                    mainItems: mainItems,
                    initialMainValue: initialMainValue,
                    decimalItems: decimalItems,
                    initialDecimalValue: initialDecimalValue,
                    isHeight: false, // It is the weight screen
                    isMetric: isKGs,
                    onValueChange: measurementController.updateSelectedValue,
                  );
                }),
              ),

              Spacer(),

              // CONTINUE BUTTON
              CustomButton(
                title: AppString.continuee,
                textStyle: AppTextStyles.s16w5P(),
                onTap: () {
                  // PRINTS THE FINAL SELECTED VALUE
                  print(
                    'Final Weight Selected: ${measurementController.weightValue.value}',
                  );
                  // Add your navigation logic here (e.g., Get.toNamed(RoutesName.nextScreen));
                  Get.offAllNamed(RoutesName.lifestyleSelectin);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- HELPER WIDGETS ---

  // Generic Unit Toggle Widget
  Widget _buildUnitToggle({
    required RxBool isMetric,
    required String metricTitle,
    required String imperialTitle,
    required void Function(bool) onToggle,
  }) {
    return Obx(() {
      final bool isSelectedMetric = isMetric.value;
      return Container(
        height: 40.h,
        width: 180.w,
        decoration: BoxDecoration(
          color: AppColors.greyNormal.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: _toggleButton(
                title: metricTitle,
                isSelected: isSelectedMetric,
                onTap: () => onToggle(true),
              ),
            ),
            Expanded(
              child: _toggleButton(
                title: imperialTitle,
                isSelected: !isSelectedMetric,
                onTap: () => onToggle(false),
              ),
            ),
          ],
        ),
      );
    });
  }

  // Helper for individual toggle buttons
  Widget _toggleButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.brandText : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: AppTextStyles.s16w5P(
            color: isSelected
                ? AppColors.white
                : AppColors.brandText.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}
