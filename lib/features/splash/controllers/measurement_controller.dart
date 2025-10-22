// features/splash/controllers/measurement_controller.dart

import 'package:get/get.dart';

class MeasurementController extends GetxController {
  // --- HEIGHT STATE (Defaults to Imperial/Fit) ---
  final RxString heightValue = '5 ft 07 in'.obs;
  final RxBool isMetricHeight = false.obs; // False = Imperial (Fit/In)

  // --- WEIGHT STATE (Defaults to Metric/kgs) ---
  final RxString weightValue = '70 kgs'.obs;
  final RxBool isMetricWeight = true.obs; // True = Kgs (Metric)

  // --- UNIT TOGGLE METHODS ---

  /// Toggles the height unit state. Called by the Unit Wheel in MeasurementPicker.
  void toggleHeightUnit(bool toMetric) {
    isMetricHeight.value = toMetric;

    // Reset to default value based on new unit
    if (toMetric) {
      // Metric Default
      heightValue.value = '170.00 cm';
    } else {
      // Imperial Default
      heightValue.value = '5 ft 07 in';
    }
  }

  /// Toggles the weight unit state. Called by the Unit Wheel in MeasurementPicker.
  void toggleWeightUnit(bool toMetric) {
    // 1. Update the reactive state flag
    isMetricWeight.value = toMetric;

    // 2. Set the default value based on the new unit
    if (toMetric) {
      // KGS (Metric) Logic:
      weightValue.value = '70 kgs';
    } else {
      // LBS (Imperial) Logic: <--- THIS IS WHERE LBS IS HANDLED
      weightValue.value = '154 lbs';
    }
  }

  // --- VALUE UPDATE METHOD (Called by MeasurementPicker) ---

  /// Updates the final displayed value whenever a wheel is scrolled.
  void updateSelectedValue(String newValue, bool isHeight) {
    if (isHeight) {
      heightValue.value = newValue;
    } else {
      weightValue.value = newValue;
    }
    print('Controller updated: $newValue');
  }
}
