import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_book_app/common/colors/app_colors.dart';
import 'package:note_book_app/common/utils/responsive_util.dart';
import 'package:note_book_app/core/services/get_it_service.dart';
import 'package:note_book_app/domain/entities/lesson_entity.dart';
import 'package:note_book_app/domain/entities/question_entity.dart';
import 'package:note_book_app/presentation/web_version/lesson/cubits/character_question_page_web/cubit/character_question_page_web_cubit.dart';
import 'package:note_book_app/presentation/web_version/lesson/cubits/keep_page_web/keep_page_web_cubit.dart';
import 'package:note_book_app/presentation/web_version/lesson/widgets/character_question_page_web/character_question_page_web.dart';
import 'package:note_book_app/presentation/web_version/lesson/widgets/keep_page_web/keep_page_web.dart';
import 'package:note_book_app/presentation/web_version/lesson/cubits/character_page_web/character_page_web_cubit.dart';
import 'package:note_book_app/presentation/web_version/lesson/cubits/character_page_web/character_page_web_state.dart';
import 'package:note_book_app/presentation/web_version/lesson/widgets/character_page_web/action_button.dart';
import 'package:note_book_app/presentation/web_version/lesson/widgets/character_page_web/character_table.dart';

class CharacterPageWeb extends StatefulWidget {
  final LessonEntity lesson;

  const CharacterPageWeb({super.key, required this.lesson});

  @override
  State<CharacterPageWeb> createState() => _CharacterPageWebState();
}

class _CharacterPageWebState extends State<CharacterPageWeb> {
  void _handleShowHiragana(BuildContext context) {
    context.read<CharacterPageWebCubit>().getAllCharacters(
          characterType: "Hiragana",
        );
  }

  void _handleShowKatakana(BuildContext context) {
    context.read<CharacterPageWebCubit>().getAllCharacters(
          characterType: "Katakana",
        );
  }

  void _handleStartQuestionsPhase(BuildContext context) {
    context.read<CharacterPageWebCubit>().showKeepPageWeb();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharacterPageWebCubit>(
      create: (context) => getIt<CharacterPageWebCubit>()
        ..getAllCharacters(characterType: "Hiragana"),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ResponsiveUtil.isDesktop(context)
                    ? 100
                    : ResponsiveUtil.isTablet(context)
                        ? 40
                        : 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ActionButton(
                    text: 'Hiragana',
                    onPressed: _handleShowHiragana,
                  ),
                  const SizedBox(width: 16),
                  ActionButton(
                    text: 'Katakana',
                    onPressed: _handleShowKatakana,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ActionButton(
                    text: 'Ôn tập',
                    onPressed: _handleStartQuestionsPhase,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              BlocConsumer<CharacterPageWebCubit, CharacterPageWebState>(
                buildWhen: (previous, current) =>
                    current is CharacterPageWebLoaded ||
                    current is CharacterPageWebKeepPage ||
                    current is CharacterPageWebQuestionLoaded,
                listener: (context, state) {
                  if (state is CharacterPageWebFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.failureMessage)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is CharacterPageWebLoading) {
                    return const SizedBox(
                      height: 400,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.kDFD3C3,
                        ),
                      ),
                    );
                  }

                  if (state is CharacterPageWebKeepPage) {
                    return BlocProvider<KeepPageWebCubit>(
                      create: (context) => KeepPageWebCubit(
                          context.read<CharacterPageWebCubit>()),
                      child: const KeepPageWeb(),
                    );
                  }

                  if (state is CharacterPageWebQuestionLoaded) {
                    return BlocProvider<CharacterQuestionPageWebCubit>(
                      create: (context) => CharacterQuestionPageWebCubit()
                        ..loadQuestions(state.questions),
                      child:
                          CharacterQuestionPageWeb(questions: state.questions),
                    );
                  }

                  if (state is CharacterPageWebLoaded) {
                    return CharacterTable(
                      characterType: state.characterType,
                      characters: state.characters,
                    );
                  }

                  return const SizedBox();
                },
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
