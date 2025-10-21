import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/splash/widgets/selection_field.dart';
import 'package:template/routes/routes_name.dart';

class LifestyleSelectionScreen extends StatelessWidget {
  LifestyleSelectionScreen({super.key});

  // Using GetX reactive variable for the selected option
  final RxString selectedLifestyle = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Age Selection Custom Widget
          SelectionField(
            title: AppString.tellUsAboutYourLifestyle,
            options: [
              'Sedentary',
              'Lightly Active',
              'Moderately Active',
              'Very Active',
            ],
            selectedOption: selectedLifestyle,
            nextPagesNamed: RoutesName.primaryHealthGoal,
          ),
        ],
      ),
    );
  }
}
