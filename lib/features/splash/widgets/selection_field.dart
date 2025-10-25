// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/image_const.dart';
import 'package:template/core/themes/app_text_style.dart';

class SelectionField extends StatelessWidget {
  final String title;
  final List<String> options;
  final String nextPagesNamed;
  final RxString selectedOption;
  final bool imageEnable;

  SelectionField({
    super.key,
    required this.title,
    required this.options,
    required this.selectedOption,
    required this.nextPagesNamed,
    this.imageEnable = false,
  });
  //Flage Image List
  final List<String> flageImage = [
    AppImages.englishUs,
    AppImages.englishUk,
    AppImages.german,
    AppImages.spanish,
    AppImages.italian,
    AppImages.hungarian,
    AppImages.french,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.h),
          //Header Text Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
            child: Text(
              title,
              style: AppTextStyles.s24w6I(color: AppColors.brandText),
            ),
          ),
          // Radio Buttons for options
          Column(
            children: List.generate(options.length, (index) {
              return GestureDetector(
                onTap: () {
                  if (imageEnable == true) {
                    // Language Mapping
                    String languageCode;

                    switch (options[index]) {
                      case 'German':
                        languageCode = 'de'; // German
                        break;
                      case 'Spanish':
                        languageCode = 'es'; // Spanish
                        break;
                      case 'Italian':
                        languageCode = 'it'; // Italian
                        break;
                      case 'French':
                        languageCode = 'fr'; // French
                        break;
                      case 'Hungarian':
                        languageCode = 'hu'; // Hungarian
                        break;
                      case 'English (UK)':
                        languageCode =
                            'en'; // English (UK) -> en for both US and UK
                        break;
                      case 'English (US)':
                        languageCode =
                            'en'; // English (US) -> en for both US and UK
                        break;
                      default:
                        languageCode = 'en'; // Default to English
                    }

                    if (languageCode == 'de' ||
                        languageCode == 'es' ||
                        languageCode == 'it' ||
                        languageCode == 'fr' ||
                        languageCode == 'hu' ||
                        languageCode == 'en') {
                      // Update Locale
                      Get.updateLocale(
                        Locale(languageCode, languageCode.toUpperCase()),
                      );
                      print(
                        "Selected Language Code : ${languageCode.toUpperCase()}.",
                      );
                    } else {
                      print("Error");
                    }
                  }
                  // Trigger the change when container is tapped
                  selectedOption.value = options[index];
                  // Navigate to the next page
                  Get.offAllNamed(nextPagesNamed);
                  print(selectedOption.value); // Print the selected option
                },
                child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.yellowishOrange,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 13.h,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 13.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //flag only selec laguage Screen
                      imageEnable
                          ? CircleAvatar(
                              radius: 15.r,
                              backgroundImage: AssetImage(flageImage[index]),
                            )
                          : SizedBox.shrink(),

                      imageEnable ? SizedBox(width: 19.w) : SizedBox.shrink(),
                      //Text
                      Text(
                        options[index],
                        style: AppTextStyles.s16w4I(color: AppColors.black),
                      ),

                      Spacer(),
                      //circle
                      Radio<String>(
                        value: options[index],
                        groupValue: selectedOption.value,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
