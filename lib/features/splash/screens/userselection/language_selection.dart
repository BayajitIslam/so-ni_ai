import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:template/core/constants/translations.dart';
import 'package:template/features/splash/widgets/selection_field.dart';
import 'package:template/routes/routes_name.dart';

class LanguageSelection extends StatelessWidget {
  LanguageSelection({super.key});

  // Using GetX reactive variable for the selected option
  final RxString selectedLanguage = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Age Selection Custom Widget
          SelectionField(
            title: AppString.selectALanguage,
            imageEnable: true,
            options: [
              'English (US)',
              'English (UK)',
              'German',
              'Spanish',
              'Italian',
              'Hungarian',
              'French',
            ],

            selectedOption: selectedLanguage,
            nextPagesNamed: RoutesName.subscriptionPages,
          ),
        ],
      ),
    );
  }
}
