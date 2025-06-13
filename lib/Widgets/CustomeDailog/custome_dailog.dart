import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final Color titleColor;
  final String primaryButtonText;
  final String secondaryButtonText;
  final VoidCallback? onPrimaryPressed;
  final VoidCallback? onSecondaryPressed;
  final Color primaryButtonColor;
  final Color secondaryButtonColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;

  const CustomDialog({
    Key? key,
    required this.title,
    required this.content,
    this.titleColor = Colors.black,
    this.primaryButtonText = 'OK',
    this.secondaryButtonText = 'Cancel',
    this.onPrimaryPressed,
    this.onSecondaryPressed,
    this.primaryButtonColor = Colors.blue,
    this.secondaryButtonColor = Colors.grey,
    this.primaryTextColor = Colors.white,
    this.secondaryTextColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 8,
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.grey.shade50,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
            const SizedBox(height: 16),
            
            // Content
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Secondary Button
                TextButton(
                  onPressed: onSecondaryPressed ?? () => Navigator.of(context).pop(),
                  style: TextButton.styleFrom(
                    backgroundColor: secondaryButtonColor,
                    foregroundColor: secondaryTextColor,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    secondaryButtonText,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                
                // Primary Button
                ElevatedButton(
                  onPressed: onPrimaryPressed ?? () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryButtonColor,
                    foregroundColor: primaryTextColor,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 2,
                  ),
                  child: Text(
                    primaryButtonText,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Helper method to show the dialog
void showCustomDialog({
  required BuildContext context,
  required String title,
  required String content,
  Color titleColor = Colors.black,
  String primaryButtonText = 'OK',
  String secondaryButtonText = 'Cancel',
  VoidCallback? onPrimaryPressed,
  VoidCallback? onSecondaryPressed,
  Color primaryButtonColor = Colors.blue,
  Color secondaryButtonColor = Colors.grey,
  Color primaryTextColor = Colors.white,
  Color secondaryTextColor = Colors.white,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return CustomDialog(
        title: title,
        content: content,
        titleColor: titleColor,
        primaryButtonText: primaryButtonText,
        secondaryButtonText: secondaryButtonText,
        onPrimaryPressed: onPrimaryPressed,
        onSecondaryPressed: onSecondaryPressed,
        primaryButtonColor: primaryButtonColor,
        secondaryButtonColor: secondaryButtonColor,
        primaryTextColor: primaryTextColor,
        secondaryTextColor: secondaryTextColor,
      );
    },
  );
}
