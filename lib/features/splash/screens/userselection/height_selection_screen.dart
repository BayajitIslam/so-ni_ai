// height_selection_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// PLACEHOLDERS: Replace with your actual imports
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/translations.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/auth/widgets/custom_button.dart';
import 'package:template/features/splash/controllers/measurement_controller.dart';
// Import the updated MeasurementPicker
import 'package:template/features/splash/widgets/measurement_picker.dart';
import 'package:template/routes/routes_name.dart';

class HeightSelectionScreen extends StatelessWidget {
  HeightSelectionScreen({super.key});

  final MeasurementController measurementController = Get.find();

  final argument = Get.arguments;

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

              SizedBox(height: 46.h), // Increased spacing after title
              // REMOVED: _buildUnitToggle widget is gone.

              // HEIGHT DATA PICKER
              Expanded(
                child: Obx(() {
                  final bool isCM = measurementController.isMetricHeight.value;

                  // Define data lists based on current unit state (isCM)
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

                    // NEW: Pass the controller's toggle function to the picker's unit wheel
                    onUnitChange: measurementController.toggleHeightUnit,
                  );
                }),
              ),

              Spacer(),

              // CONTINUE BUTTON
              CustomButton(
                title: AppString.continuee,
                textStyle: AppTextStyles.s16w5P(),
                onTap: () {
                  print(
                    'Final Height Selected: ${measurementController.heightValue.value}',
                  );
                  if (argument == "next_pages") {
                    Get.toNamed(
                      RoutesName.weighttSelection,
                      arguments: argument,
                    );
                  } else {
                    Get.back();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
