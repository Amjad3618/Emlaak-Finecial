import 'package:flutter/material.dart';

class CustomRadioButton<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final String? label;
  final double size;
  final Color selectedColor;
  final Color unselectedColor;
  final Color borderColor;
  final double borderWidth;
  final bool enabled;

  const CustomRadioButton({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.label,
    this.size = 20.0,
    this.selectedColor = Colors.green,
    this.unselectedColor = Colors.white,
    this.borderColor = Colors.grey,
    this.borderWidth = 2.0,
    this.enabled = true,
  }) : super(key: key);

  bool get isSelected => value == groupValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? () => onChanged?.call(value) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? selectedColor : borderColor,
                width: borderWidth,
              ),
              color: isSelected ? selectedColor.withOpacity(0.1) : unselectedColor,
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: size * 0.6,
                      height: size * 0.6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: selectedColor,
                      ),
                    ),
                  )
                : null,
          ),
          if (label != null) ...[
            const SizedBox(width: 8),
            Text(
              label!,
              style: TextStyle(
                fontSize: 16,
                color: enabled ? Colors.black87 : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ],
      ),
    );
  }
}