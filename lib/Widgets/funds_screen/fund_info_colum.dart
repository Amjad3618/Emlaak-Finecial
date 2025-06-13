import 'package:flutter/material.dart';

import '../../Utils/custome_text.dart';

class CustomFundInfoWidget extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final Color? titleColor;
  final Color? valueColor;
  final Color? subtitleColor;
  final Color? backgroundColor;
  final double? titleFontSize;
  final double? valueFontSize;
  final double? subtitleFontSize;
  final FontWeight? titleFontWeight;
  final FontWeight? valueFontWeight;
  final FontWeight? subtitleFontWeight;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final Border? border;
  final List<BoxShadow>? boxShadow;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final Widget? icon;
  final bool showDivider;
  final Color? dividerColor;
  final double? dividerThickness;

  const CustomFundInfoWidget({
    Key? key,
    required this.title,
    required this.value,
    this.subtitle,
    this.titleColor,
    this.valueColor,
    this.subtitleColor,
    this.backgroundColor,
    this.titleFontSize = 14,
    this.valueFontSize = 16,
    this.subtitleFontSize = 12,
    this.titleFontWeight = FontWeight.w600,
    this.valueFontWeight = FontWeight.bold,
    this.subtitleFontWeight = FontWeight.normal,
    this.padding,
    this.margin,
    this.borderRadius,
    this.border,
    this.boxShadow,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.icon,
    this.showDivider = false,
    this.dividerColor,
    this.dividerThickness = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(4.0),
      padding: padding ?? const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(8.0),
        border: border,
        boxShadow: boxShadow,
      ),
      child: Column(
        mainAxisAlignment: mainAxisAlignment!,
        crossAxisAlignment: crossAxisAlignment!,
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(height: 8),
          ],
          CustomText(
            title,
            fontSize: titleFontSize!,
            color: titleColor ?? Colors.blue,
            fontWeight: titleFontWeight!,
          ),
          if (showDivider) ...[
            const SizedBox(height: 8),
            Divider(
              color: dividerColor ?? Colors.grey.shade300,
              thickness: dividerThickness,
            ),
            const SizedBox(height: 8),
          ] else
            const SizedBox(height: 6),
          CustomText(
            value,
            fontSize: valueFontSize!,
            color: valueColor ?? Colors.black,
            fontWeight: valueFontWeight!,
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            CustomText(
              subtitle!,
              fontSize: subtitleFontSize!,
              color: subtitleColor ?? Colors.grey,
              fontWeight: subtitleFontWeight!,
            ),
          ],
        ],
      ),
    );
  }
}