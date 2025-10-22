// controllers/measurement_controller.dart

import 'package:get/get.dart';

class MeasurementController extends GetxController {
  // --- HEIGHT STATE ---
  final RxString heightValue = '170.00 cm'.obs;
  // True = CM (Metric), False = Fit/In (Imperial)
  final RxBool isMetricHeight = true.obs;

  // --- WEIGHT STATE ---
  final RxString weightValue = '70 kgs'.obs;
  // True = Kgs (Metric), False = Lbs (Imperial)
  final RxBool isMetricWeight = true.obs;

  // --- UNIT TOGGLE METHODS ---

  void toggleHeightUnit(bool toMetric) {
    isMetricHeight.value = toMetric;
  }

  void toggleWeightUnit(bool toMetric) {
    isMetricWeight.value = toMetric;
  }

  // --- VALUE UPDATE METHOD (Called by MeasurementPicker) ---

  void updateSelectedValue(String newValue, bool isHeight) {
    if (isHeight) {
      heightValue.value = newValue;
    } else {
      weightValue.value = newValue;
    }
    print('Controller updated: $newValue');
  }
}
