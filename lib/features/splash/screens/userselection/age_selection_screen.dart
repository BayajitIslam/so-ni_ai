import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/splash/widgets/selection_field.dart';
import 'package:template/routes/routes_name.dart';

class AgeSelectionScreen extends StatelessWidget {
  // Using GetX reactive variable for the selected option
  final RxString selectedAgeRange = ''.obs;

  AgeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Age Selection Custom Widget
          SelectionField(
            title: AppString.howOldAreYou,
            options: [
              '13 to 17',
              '18 to 24',
              '25 to 34',
              '35 to 44',
              '45 to 54',
              '55+',
            ],
            selectedOption: selectedAgeRange,
            nextPagesNamed: RoutesName.genderSelection,
          ),
        ],
      ),
    );
  }
}
