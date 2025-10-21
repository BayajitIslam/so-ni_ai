import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_string.dart';
import 'package:template/features/splash/widgets/selection_field.dart';
import 'package:template/routes/routes_name.dart';

class GenderSelectionScreen extends StatelessWidget {
  GenderSelectionScreen({super.key});

  // Using GetX reactive variable for the selected option
  final RxString selectedGender = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Age Selection Custom Widget
          SelectionField(
            title: AppString.whatsYourGender,
            options: ['Female', 'Male', 'other'],
            selectedOption: selectedGender,
            nextPagesNamed: RoutesName.heightSelection,
          ),
        ],
      ),
    );
  }
}
