import 'package:flutter/material.dart';
import 'package:template/core/constants/app_colors.dart';

class CustomCheckbox extends StatefulWidget {
  final double size;
  final Color borderColor;
  final Color checkColor;

  const CustomCheckbox({
    super.key,
    this.size = 18.0,
    this.borderColor = Colors.black,
    this.checkColor = Colors.green,
  });

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: isChecked ? AppColors.black : Colors.transparent,
          border: Border.all(color: widget.borderColor, width: 2.0),
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: isChecked
            ? Icon(
                Icons.check,
                color: widget.checkColor,

                size: widget.size * 0.8, // Adjust icon size
              )
            : null,
      ),
    );
  }
}
