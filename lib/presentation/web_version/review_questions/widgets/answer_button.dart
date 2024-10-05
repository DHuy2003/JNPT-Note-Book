import 'package:flutter/material.dart';
import 'package:note_book_app/common/colors/app_colors.dart';

class AnswerButton extends StatelessWidget {
  final String answerText;
  final bool isCorrect;
  final bool isSelected;
  final void Function() onPressed;
  final double height;

  const AnswerButton({
    super.key,
    required this.answerText,
    required this.isCorrect,
    required this.isSelected,
    required this.onPressed,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? (isCorrect ? AppColors.successColor : AppColors.failureColor)
              : AppColors.white,
        ),
        onPressed: onPressed,
        child: Text(
          answerText,
          style: const TextStyle(
            fontSize: 18,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
