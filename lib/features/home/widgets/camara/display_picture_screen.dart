import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/features/home/widgets/food_screen.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // final ScanController controller = Get.put(ScanController());
    return Scaffold(
      appBar: AppBar(title: const Text("Preview")),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.file(File(imagePath), fit: BoxFit.contain),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.red,
                    elevation: 4,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    CupertinoIcons.xmark,
                    color: Colors.white,
                    size: 32,
                  ),
                ),

                const SizedBox(width: 40),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    backgroundColor: AppColors.black,
                    elevation: 4,
                  ),
                  onPressed: () {
                    // controller.imagePath = imagePath;
                    // controller.scanIngredients();
                    // Get.offAll(IngredientScreen(imagePath: imagePath));
                    Get.offAll(FoodScreen());
                  },
                  child: const Icon(
                    CupertinoIcons.check_mark,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
