import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_book_app/common/utils/responsive_util.dart';
import 'package:note_book_app/domain/entities/question_entity.dart';
import 'package:note_book_app/presentation/web_version/lesson/cubits/keep_page_web/keep_page_web_cubit.dart';
import 'package:note_book_app/presentation/web_version/lesson/cubits/keep_page_web/keep_page_web_state.dart';
import 'package:note_book_app/presentation/web_version/lesson/widgets/character_question_page_web/character_question_page_web.dart';
import 'package:note_book_app/presentation/web_version/lesson/widgets/keep_page_web/action_button.dart';

class KeepPageWeb extends StatelessWidget {
  const KeepPageWeb({super.key});

  void _navigateToQuiz(BuildContext context, List<QuestionEntity> questions) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CharacterQuestionPageWeb(questions: questions),
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

    return BlocListener<KeepPageWebCubit, KeepPageWebState>(
      listener: (context, state) {
        if (state is KeepPageWebLoaded) {
          _navigateToQuiz(context, state.questions);
        } else if (state is KeepPageWebError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
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
                  .selectQuestionType(
                      questionType: 'Hiragana',
                      answerType: 'Romanji',
                      numberOfQuestions: 10),
              fontSize: fontSize,
              height: buttonHeight,
            ),
            const SizedBox(height: 16),
            ActionButton(
              text: "Katakana -> Romanji",
              onPressed: (context) => context
                  .read<KeepPageWebCubit>()
                  .selectQuestionType(
                      questionType: 'Katakana',
                      answerType: 'Romanji',
                      numberOfQuestions: 10),
              fontSize: fontSize,
              height: buttonHeight,
            ),
            const SizedBox(height: 16),
            ActionButton(
              text: "Romanji -> Hiragana",
              onPressed: (context) => context
                  .read<KeepPageWebCubit>()
                  .selectQuestionType(
                      questionType: 'Romanji',
                      answerType: 'Hiragana',
                      numberOfQuestions: 10),
              fontSize: fontSize,
              height: buttonHeight,
            ),
            const SizedBox(height: 16),
            ActionButton(
              text: "Romanji -> Katakana",
              onPressed: (context) => context
                  .read<KeepPageWebCubit>()
                  .selectQuestionType(
                      questionType: 'Romanji',
                      answerType: 'Katakana',
                      numberOfQuestions: 10),
              fontSize: fontSize,
              height: buttonHeight,
            ),
          ],
        ),
      ),
    );
  }
}
