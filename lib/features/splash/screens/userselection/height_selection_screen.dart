import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/auth/widgets/custom_button.dart';
import 'package:template/features/splash/controllers/measurement_controller.dart';
import 'package:template/features/splash/widgets/measurement_picker.dart';
import 'package:template/routes/routes_name.dart';

class HeightSelectionScreen extends StatelessWidget {
  HeightSelectionScreen({super.key});

  final MeasurementController measurementController = Get.find();
  // Define parameters based on the screen type (Height or Weight)
  final bool isHeight = true;
  String get unit => isHeight ? 'cm' : 'kgs';
  List<int> get mainItems => isHeight
      ? List<int>.generate(71, (i) => 140 + i) // 140 to 210
      : List<int>.generate(61, (i) => 40 + i); // 40 to 100
  int get initialMainValue => isHeight ? 170 : 70;
  List<int> get decimalItems => isHeight
      ? List<int>.generate(100, (i) => i) // 00 to 99
      : const []; // No decimals for weight in the image
  int get initialDecimalValue => isHeight ? 0 : 0;

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
                child: Text(
                  AppString.whatsYourHeight,
                  style: AppTextStyles.s24w6I(color: AppColors.brandText),
                ),
              ),

              SizedBox(height: 20.h),

              _buildUnitToggle(
                isMetric: measurementController.isMetricHeight,
                metricTitle: 'CM',
                imperialTitle: 'Fit',
                onToggle: measurementController.toggleHeightUnit,
              ),

              SizedBox(height: 20.h),

              // HEIGHT DATA PICKER
              Expanded(
                child: Obx(() {
                  final bool isCM = measurementController.isMetricHeight.value;

                  final String unit = isCM ? 'cm' : 'in';
                  final List<int> mainItems = isCM
                      ? List<int>.generate(71, (i) => 140 + i) // CM: 140 to 210
                      : List<int>.generate(5, (i) => 4 + i); // FT: 4 ft to 8 ft
                  final int initialMainValue = isCM ? 170 : 5;
                  final List<int> decimalItems = isCM
                      ? List<int>.generate(100, (i) => i) // Decimals 00-99
                      : List<int>.generate(12, (i) => i); // Inches 0-11
                  final int initialDecimalValue = isCM ? 0 : 7;

                  return MeasurementPicker(
                    unit: unit,
                    mainItems: mainItems,
                    initialMainValue: initialMainValue,
                    decimalItems: decimalItems,
                    initialDecimalValue: initialDecimalValue,
                    isHeight: true,
                    isMetric: isCM,
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
                    'Final Height Selected: ${measurementController.heightValue.value}',
                  );
                  Get.toNamed(RoutesName.weighttSelection);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

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

  // Helper for toggle buttons (Reused in WeightScreen)
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
