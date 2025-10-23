// widgets/measurement_picker.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:audioplayers/audioplayers.dart';
// PLACEHOLDERS: Replace with your actual imports
import 'package:template/core/constants/app_colors.dart';
import 'package:template/core/themes/app_text_style.dart';

// Callback signature for value change
typedef ValueChangeCallback = void Function(String value, bool isHeight);

// Callback signature for unit change (needed for the scrollable unit wheel)
typedef UnitChangeCallback = void Function(bool newIsMetric);

class MeasurementPicker extends StatefulWidget {
  final String unit;
  final List<int> mainItems;
  final int initialMainValue;
  final List<int> decimalItems; // Used for CM decimals or FT inches
  final int initialDecimalValue;
  final bool isHeight;
  final bool isMetric; // Flag for CM/KGs or FT/LBS
  final ValueChangeCallback onValueChange;

  final UnitChangeCallback? onUnitChange;

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
    this.onUnitChange,
  });

  @override
  State<MeasurementPicker> createState() => _MeasurementPickerState();
}

// Define fixed unit options for the Height and Weight unit wheels
const List<String> _heightUnits = ['cm', 'Fit'];
const List<String> _weightUnits = ['kgs', 'lbs'];

class _MeasurementPickerState extends State<MeasurementPicker> {
  late int selectedMainValue;
  late int selectedDecimalValue;

  late FixedExtentScrollController _mainController;
  late FixedExtentScrollController _decimalController;

  // Audio Player instance for scroll click sound
  // late AudioPlayer _audioPlayer;

  // Flag to check if the decimal controller is initialized (i.e., we are using the second wheel)
  bool get _isDecimalControllerInitialized => widget.decimalItems.isNotEmpty;

  @override
  void initState() {
    super.initState();

    // Initialize AudioPlayer
    // _audioPlayer = AudioPlayer();
    // _audioPlayer.setReleaseMode(ReleaseMode.stop);

    // Initialize state and controllers
    _initializeStateAndControllers();
  }

  // Handle widget updates (crucial for unit change rebuilds from GetX)
  @override
  void didUpdateWidget(covariant MeasurementPicker oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If the unit system changed (Metric to Imperial or vice versa),
    // we need to reset controllers to the new initial values/lists.
    if (widget.isMetric != oldWidget.isMetric) {
      _disposeControllers();
      _initializeStateAndControllers();
    }
  }

  void _initializeStateAndControllers() {
    // 1. Set values
    selectedMainValue = widget.initialMainValue;
    selectedDecimalValue = widget.initialDecimalValue;

    // 2. Initialize Main Controller
    final initialMainIndex = widget.mainItems.indexOf(widget.initialMainValue);
    _mainController = FixedExtentScrollController(
      initialItem: initialMainIndex != -1 ? initialMainIndex : 0,
    );

    // 3. Initialize Decimal Controller (conditionally)
    if (_isDecimalControllerInitialized) {
      final initialDecimalIndex = widget.decimalItems.indexOf(
        widget.initialDecimalValue,
      );
      // NOTE: This controller is only initialized if decimalItems is NOT empty,
      // which is true for Height (CM or FT/IN) but false for Weight.
      _decimalController = FixedExtentScrollController(
        initialItem: initialDecimalIndex != -1 ? initialDecimalIndex : 0,
      );
    }

    // 4. Update parent on initialization
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateParentValue());
  }

  @override
  void dispose() {
    _disposeControllers();
    // _audioPlayer.dispose();
    super.dispose();
  }

  void _disposeControllers() {
    _mainController.dispose();
    // Only try to dispose if it was initialized
    if (_isDecimalControllerInitialized && mounted) {
      _decimalController.dispose();
    }
  }

  // Helper method to calculate the full value and call the parent callback
  void _updateParentValue() {
    final String selectedValue;

    // --- HEIGHT LOGIC (CM or FT/IN) ---
    if (widget.isHeight) {
      if (widget.isMetric) {
        // CM format: "170.00 cm"
        selectedValue =
            '$selectedMainValue.${selectedDecimalValue.toString().padLeft(2, '0')} ${widget.unit}';
      } else {
        // FT/IN format: "5 ft 7 in"
        selectedValue = '$selectedMainValue.$selectedDecimalValue Fit';
      }
    }
    // --- WEIGHT LOGIC (KGS or LBS) ---
    else {
      // KGS/LBS format: "70 kgs" or "154 lbs"
      selectedValue = '$selectedMainValue ${widget.unit}';
    }

    widget.onValueChange(selectedValue, widget.isHeight);
  }

  // Helper method to trigger both haptic and audio feedback
  void _triggerFeedback() async {
    // 1. Haptic Feedback (Vibration)
    HapticFeedback.selectionClick();

    // 2. Audio Feedback (Click Sound)
    // NOTE: Path must match your pubspec.yaml asset declaration.
    // await _audioPlayer.play(AssetSource('sounds/tick.mp3'), volume: 0.5);
  }

  // Common item builder for the ListWheelScrollView
  Widget _pickerItem(int value, bool isSelected) {
    // Only pad with '0' if it's the decimal part of the CM measurement
    final isDecimal = widget.isHeight && widget.isMetric;
    final text = value.toString().padLeft(isDecimal ? 2 : 1, '0');

    return Center(
      child: Text(
        text,
        style: AppTextStyles.s22w4P(
          color: isSelected
              ? AppColors
                    .icon // Selected color
              : AppColors.black.withOpacity(0.35),
        ),
      ),
    );
  }

  // Helper method for the Unit Wheel (CM/Fit or kgs/lbs)
  Widget _buildUnitWheel(double itemExtent, int selectedIndex) {
    // Determine which list to use
    final List<String> units = widget.isHeight ? _heightUnits : _weightUnits;

    return SizedBox(
      width: 70.w,
      height: 230.h,
      child: ListWheelScrollView.useDelegate(
        itemExtent: itemExtent,
        perspective: 0.005,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) {
          _triggerFeedback();

          // Logic: 0 is Metric, 1 is Imperial
          final bool newIsMetric = index == 0;

          if (newIsMetric != widget.isMetric && widget.onUnitChange != null) {
            widget.onUnitChange!(newIsMetric);
          }
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            if (index < 0 || index >= units.length) return null;
            final unitText = units[index];
            final isSelected = index == selectedIndex;

            return Center(
              child: Text(
                unitText,
                style: AppTextStyles.s22w4P(
                  color: isSelected
                      ? AppColors.icon
                      : AppColors.black.withOpacity(0.35),
                ),
              ),
            );
          },
          childCount: units.length,
        ),
      ),
    );
  }

  // Helper method to build the ListWheelScrollView (Reused for main and decimal)
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
        // Key forces a full rebuild/re-render when items change (e.g., unit switch)
        key: ValueKey(items.hashCode),
        controller: controller,
        itemExtent: itemExtent,
        perspective: 0.005,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) {
          _triggerFeedback();
          onSelectedItemChanged(index);
        },
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

  @override
  Widget build(BuildContext context) {
    final double pickerHeight = 220.h;
    final double itemExtent = 40.h;

    // The index of the currently selected unit for the unit wheel (0=Metric, 1=Imperial)
    final unitSelectedIndex = widget.isMetric ? 0 : 1;

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
              if (_isDecimalControllerInitialized) ...[
                // Separator Logic (e.g., 'ft' label for imperial height)
                if (widget.isHeight && !widget.isMetric)
                  Text(
                    '.',
                    style: AppTextStyles.s16w5P(
                      color: AppColors.brandText.withOpacity(0.5),
                    ),
                  ),

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

              // --- UNIT WHEEL (Always present for Height and Weight) ---
              // The logic for displaying 'in' is handled inside _updateParentValue
              // which uses 'in' for the second column, not the unit wheel.
              _buildUnitWheel(itemExtent, unitSelectedIndex),
            ],
          ),
        ],
      ),
    );
  }
}
