import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:template/core/constants/translations.dart';
import 'package:template/features/splash/widgets/selection_field.dart';
import 'package:template/routes/routes_name.dart';

class DietaryRestrictionScreen extends StatelessWidget {
  DietaryRestrictionScreen({super.key});

  // Using GetX reactive variable for the selected option
  final RxString selectedSpecificDiet = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Age Selection Custom Widget
          SelectionField(
            title: AppString.doyouHaveAnyDietryRestrication,
            options: ['Nuts', 'Dairy', 'Gluten', 'Shellfish', "Other"],
            selectedOption: selectedSpecificDiet,
            nextPagesNamed: RoutesName.languageSelection,
          ),
        ],
      ),
    );
  }
}
