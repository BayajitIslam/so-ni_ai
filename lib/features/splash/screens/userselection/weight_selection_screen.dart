// weight_selection_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// PLACEHOLDERS: Replace with your actual imports
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/translations.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/auth/widgets/custom_button.dart';
import 'package:template/features/splash/controllers/measurement_controller.dart';
import 'package:template/features/splash/widgets/measurement_picker.dart';
import 'package:template/routes/routes_name.dart';

class WeightSelectionScreen extends StatelessWidget {
  // ACCESS: The controller is retrieved from memory here, as it was put
  // in the HeightSelectionScreen.
  final MeasurementController measurementController = Get.find();

  WeightSelectionScreen({super.key});

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
                  AppString.whatsYourWeight,
                  style: AppTextStyles.s24w6I(color: AppColors.brandText),
                ),
              ),

              SizedBox(height: 46.h), // Spacing matches the height screen
              // WEIGHT DATA PICKER
              Expanded(
                child: Obx(() {
                  final bool isKGs = measurementController.isMetricWeight.value;

                  // Define data lists based on current unit state (isKGs)
                  final String unit = isKGs ? 'kgs' : 'lbs';

                  // Main Items:
                  // KGs: 40 to 200 (161 items)
                  // LBS: 88 to 440 (353 items)
                  final List<int> mainItems = isKGs
                      ? List<int>.generate(161, (i) => 40 + i)
                      : List<int>.generate(353, (i) => 88 + i);

                  // Initial values match the controller's defaults
                  final int initialMainValue = isKGs ? 70 : 154;

                  // Weight is simple: NO decimal wheel, pass empty lists
                  final List<int> decimalItems = const [];
                  final int initialDecimalValue = 0;

                  return MeasurementPicker(
                    unit: unit,
                    mainItems: mainItems,
                    initialMainValue: initialMainValue,
                    decimalItems: decimalItems,
                    initialDecimalValue: initialDecimalValue,
                    isHeight:
                        false, // <-- IMPORTANT: This tells the picker it's weight
                    isMetric: isKGs,
                    onValueChange: measurementController.updateSelectedValue,

                    // Pass the unit toggle function to the unit wheel
                    onUnitChange: measurementController.toggleWeightUnit,
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
                    'Final Weight Selected: ${measurementController.weightValue.value}',
                  );
                  // Assuming this is the correct route name for the next step:
                  Get.toNamed(RoutesName.lifestyleSelectin);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
