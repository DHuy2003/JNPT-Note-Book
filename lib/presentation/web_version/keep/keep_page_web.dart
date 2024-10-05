import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_book_app/common/colors/app_colors.dart';
import 'package:note_book_app/common/utils/responsive_util.dart';
import 'package:note_book_app/presentation/web_version/keep/cubits/keep_page_web_cubit.dart';
import 'package:note_book_app/presentation/web_version/keep/widgets/action_button.dart';
import 'package:note_book_app/presentation/web_version/review_questions/review_questions_page_web.dart';

class KeepPageWeb extends StatelessWidget {
  const KeepPageWeb({super.key});

  void _navigateToQuiz(BuildContext context, String questionType) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ReviewQuestionsPageWeb(questionType: questionType),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double buttonHeight = ResponsiveUtil.isDesktop(context)
        ? 60
        : ResponsiveUtil.isTablet(context)
            ? 50
            : 40;
    double fontSize = ResponsiveUtil.isDesktop(context)
        ? 24
        : ResponsiveUtil.isTablet(context)
            ? 20
            : 16;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ôn tập'),
        backgroundColor: AppColors.k8D493A,
      ),
      body: BlocProvider(
        create: (context) => KeepPageWebCubit(),
        child: BlocListener<KeepPageWebCubit, KeepPageWebState>(
          listener: (context, state) {
            if (state is KeepPageWebSelected) {
              _navigateToQuiz(context, state.questionType);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ActionButton(
                  text: "Hiragana -> Romanji",
                  onPressed: (context) => context
                      .read<KeepPageWebCubit>()
                      .selectQuestionType('Hiragana'),
                  fontSize: fontSize,
                  height: buttonHeight,
                ),
                const SizedBox(height: 16),
                ActionButton(
                  text: "Katakana -> Romanji",
                  onPressed: (context) => context
                      .read<KeepPageWebCubit>()
                      .selectQuestionType('Katakana'),
                  fontSize: fontSize,
                  height: buttonHeight,
                ),
                const SizedBox(height: 16),
                ActionButton(
                  text: "Romanji -> Hiragana",
                  onPressed: (context) => context
                      .read<KeepPageWebCubit>()
                      .selectQuestionType('RomanjiToHiragana'),
                  fontSize: fontSize,
                  height: buttonHeight,
                ),
                const SizedBox(height: 16),
                ActionButton(
                  text: "Romanji -> Katakana",
                  onPressed: (context) => context
                      .read<KeepPageWebCubit>()
                      .selectQuestionType('RomanjiToKatakana'),
                  fontSize: fontSize,
                  height: buttonHeight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
