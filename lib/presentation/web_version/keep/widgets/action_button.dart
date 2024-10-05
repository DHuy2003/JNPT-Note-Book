import 'package:flutter/material.dart';
import 'package:note_book_app/common/colors/app_colors.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final void Function(BuildContext) onPressed;
  final double fontSize;
  final double height;
  const ActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 16,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
        minimumSize:
            WidgetStatePropertyAll<Size>(Size(double.infinity, height)),
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        overlayColor: WidgetStatePropertyAll(AppColors.black.withOpacity(0.08)),
        backgroundColor: const WidgetStatePropertyAll(AppColors.kF8EDE3),
      ),
      onPressed: () => onPressed(context),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize, // Use fontSize parameter
          color: AppColors.black.withOpacity(0.4),
        ),
      ),
    );
  }
}
