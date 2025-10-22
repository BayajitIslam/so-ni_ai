// widgets/measurement_picker.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// PLACEHOLDERS: Replace with your actual imports
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/themes/app_text_style.dart';

// Callback signature now includes the isHeight flag
typedef ValueChangeCallback = void Function(String value, bool isHeight);

class MeasurementPicker extends StatefulWidget {
  final String unit;
  final List<int> mainItems;
  final int initialMainValue;
  final List<int> decimalItems;
  final int initialDecimalValue;
  final bool isHeight;
  final bool isMetric; // Flag for CM/KGs or FT/LBS
  final ValueChangeCallback onValueChange;

  const MeasurementPicker({
    super.key,
    required this.unit,
    required this.mainItems,
    required this.initialMainValue,
    required this.decimalItems,
    required this.initialDecimalValue,
    required this.isHeight,
    required this.isMetric,
    required this.onValueChange,
  });

  @override
  State<MeasurementPicker> createState() => _MeasurementPickerState();
}

class _MeasurementPickerState extends State<MeasurementPicker> {
  late int selectedMainValue;
  late int selectedDecimalValue;

  late FixedExtentScrollController _mainController;
  late FixedExtentScrollController _decimalController;

  @override
  void initState() {
    super.initState();
    selectedMainValue = widget.initialMainValue;
    selectedDecimalValue = widget.initialDecimalValue;

    final initialMainIndex = widget.mainItems.indexOf(widget.initialMainValue);
    _mainController = FixedExtentScrollController(
      initialItem: initialMainIndex != -1 ? initialMainIndex : 0,
    );

    // Initialize decimal controller only if decimal/inches are relevant
    if (widget.decimalItems.isNotEmpty) {
      final initialDecimalIndex = widget.decimalItems.indexOf(
        widget.initialDecimalValue,
      );
      _decimalController = FixedExtentScrollController(
        initialItem: initialDecimalIndex != -1 ? initialDecimalIndex : 0,
      );
    }
    _updateParentValue();
  }

  // Helper method to calculate the full value and call the parent callback
  void _updateParentValue() {
    final String selectedValue;

    // --- HEIGHT LOGIC (CM or FT/IN) ---
    if (widget.isHeight) {
      if (widget.isMetric) {
        // CM format: "170.00 cm"
        selectedValue =
            '${selectedMainValue}.${selectedDecimalValue.toString().padLeft(2, '0')} ${widget.unit}';
      } else {
        // FT/IN format: "5 ft 7 in"
        selectedValue = '${selectedMainValue} ft ${selectedDecimalValue} in';
      }
    }
    // --- WEIGHT LOGIC (KGS or LBS) ---
    else {
      // KGS/LBS format: "70 kgs" or "154 lbs"
      selectedValue = '$selectedMainValue ${widget.unit}';
    }

    widget.onValueChange(selectedValue, widget.isHeight);
  }

  // Common item builder for the ListWheelScrollView
  Widget _pickerItem(int value, bool isSelected) {
    final isDecimal = widget.isHeight && widget.isMetric;
    final text = value.toString().padLeft(isDecimal ? 2 : 1, '0');

    return Center(
      child: Text(
        text,
        style: AppTextStyles.s20w5P(
          color: isSelected
              ? AppColors.icon
              : AppColors.black.withOpacity(0.35),
          fontSize: 30,
          fontweight: isSelected ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double pickerHeight = 220.h;
    final double itemExtent = 40.h;

    return SizedBox(
      height: pickerHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 1. Highlighted Selection Bar
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: itemExtent,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.yellowishOrange,
                  borderRadius: BorderRadius.circular(7.r),
                ),
              ),
            ],
          ),

          // 2. The Pickers (Row of ListWheelScrollView)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --- MAIN VALUE PICKER (CM/FT/KG/LB) ---
              _buildWheelPicker(
                controller: _mainController,
                items: widget.mainItems,
                itemExtent: itemExtent,
                width: 75.w,
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedMainValue = widget.mainItems[index];
                    _updateParentValue();
                  });
                },
                selectedIndex: widget.mainItems.indexOf(selectedMainValue),
              ),

              // --- DECIMAL/INCHES PICKER ---
              if (widget.decimalItems.isNotEmpty) ...[
                // Separator Logic
                SizedBox(width: 5.w),
                if (widget.isHeight &&
                    !widget.isMetric) // For FT/IN, show 'ft' label
                  Text(
                    'ft',
                    style: AppTextStyles.s16w5P(
                      color: AppColors.brandText.withOpacity(0.5),
                    ),
                  ),
                SizedBox(width: 5.w),

                // The Decimal/Inches Picker Column
                _buildWheelPicker(
                  controller: _decimalController,
                  items: widget.decimalItems,
                  itemExtent: itemExtent,
                  width: 55.w,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedDecimalValue = widget.decimalItems[index];
                      _updateParentValue();
                    });
                  },
                  selectedIndex: widget.decimalItems.indexOf(
                    selectedDecimalValue,
                  ),
                ),

                SizedBox(width: 10.w),
              ],

              // --- UNIT DISPLAY (cm / in / kgs / lbs) ---
              SizedBox(
                width: 70.w,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    // Show 'in' for feet/inches mode, otherwise use the provided unit ('cm'/'kgs'/'lbs')
                    widget.isHeight && !widget.isMetric ? 'in' : widget.unit,
                    style: AppTextStyles.s22w4P(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to build the ListWheelScrollView
  Widget _buildWheelPicker({
    required FixedExtentScrollController controller,
    required List<int> items,
    required double width,
    required double itemExtent,
    required ValueChanged<int> onSelectedItemChanged,
    required int selectedIndex,
  }) {
    return SizedBox(
      width: width,
      height: 230.h,
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: itemExtent,
        perspective: 0.005,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: onSelectedItemChanged,
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            if (index < 0 || index >= items.length) return null;
            return _pickerItem(items[index], index == selectedIndex);
          },
          childCount: items.length,
        ),
      ),
    );
  }
}
