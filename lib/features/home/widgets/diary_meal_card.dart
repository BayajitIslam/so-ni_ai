import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/constants/my_icons.dart';
import 'package:template/core/themes/app_text_style.dart';
import 'package:template/features/auth/widgets/custom_button.dart';

class DiaryMealCard extends StatelessWidget {
  final String title;
  const DiaryMealCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.yellowishLightOrange,
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.5.h),
      child: Column(
        children: [
          //icon and name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //icon
              CircleAvatar(
                radius: 25.r,
                backgroundColor: AppColors.white,
                child: Icon(MyIcons.eat, color: AppColors.icon, size: 22.sp),
              ),

              //name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.s16w6M()),
                  SizedBox(height: 5.h),
                  Text("420 kcal", style: AppTextStyles.s14w5M()),
                ],
              ),
            ],
          ),
          //
          SizedBox(height: 10.h),
          _buildEatingRow("Apple"),
          _buildEatingRow("Almonds (20g)"),
          _buildEatingRow("Black coffee"),

          SizedBox(height: 10.h),
          //change meal button
          CustomButton(
            title: "Change Meal",
            verticlePadding: 14,
            radius: 25,
            textStyle: AppTextStyles.s14w5P(),

            onTap: () {
              showAddItemsBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }
}

//
Widget _buildEatingRow(String name) {
  return Row(
    children: [
      Container(
        width: 3.w,
        height: 3.h,
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(111.r),
        ),
        margin: EdgeInsets.only(left: 8),
      ),

      SizedBox(width: 8.w),
      Text(name, style: AppTextStyles.s16w5M()),
      Spacer(),
      Icon(Icons.delete_outline),
    ],
  );
}

// ============================================
// 🎯 USE THIS FUNCTION - Just call it!
// ============================================
void showAddItemsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: _AddItemsBottomSheet(),
    ),
  );
}

// ============================================
// Internal Widget - Don't touch this
// ============================================
class _AddItemsBottomSheet extends StatefulWidget {
  @override
  State<_AddItemsBottomSheet> createState() => _AddItemsBottomSheetState();
}

class _AddItemsBottomSheetState extends State<_AddItemsBottomSheet> {
  final List<TextEditingController> _controllers = [TextEditingController()];

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addMoreField() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  void _addToDiary() {
    List<String> items = [];
    for (var controller in _controllers) {
      if (controller.text.trim().isNotEmpty) {
        items.add(controller.text.trim());
      }
    }

    if (items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one item')),
      );
      return;
    }

    // Close bottom sheet with items
    Navigator.pop(context, items);

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added ${items.length} item(s) to diary')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.brand,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag Handle
          Center(
            child: Container(
              width: 76.w,
              height: 3.h,
              decoration: BoxDecoration(
                color: AppColors.buttonBg,
                borderRadius: BorderRadius.circular(3.r),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          // Title
          Center(
            child: Text(
              "Add Manually Meal",
              style: AppTextStyles.s20w5P(color: AppColors.icon),
            ),
          ),
          SizedBox(height: 20.h),

          // Dynamic Input Fields
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.yellowishLightOrange,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.25),
                  blurRadius: 0.4,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16),

            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Add Items",
                      style: AppTextStyles.s16w5P(color: AppColors.icon),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 250.h),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _controllers.length,
                    itemBuilder: (context, index) {
                      return TextField(
                        controller: _controllers[index],
                        decoration: InputDecoration(
                          hintText: index == 0 ? 'Orange' : 'Item ${index + 1}',
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 15.sp,
                          ),
                          filled: true,
                          fillColor: AppColors.yellowishLightOrange,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              color: AppColors.black,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              color: AppColors.black,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              color: AppColors.brandBorder,
                              width: 1,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 0.h,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 4.h),

                // Add More Button
                GestureDetector(
                  onTap: _addMoreField,
                  child: Row(
                    children: [
                      Icon(Icons.add, color: AppColors.icon, size: 16.sp),
                      SizedBox(width: 8.w),
                      Text(
                        "Add More",
                        style: AppTextStyles.s14w4P(color: AppColors.icon),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),

                // Add On Diary Button
                Row(
                  children: [
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: _addToDiary,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonBg,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          "Add on diary",
                          style: AppTextStyles.s14w4P(color: AppColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
