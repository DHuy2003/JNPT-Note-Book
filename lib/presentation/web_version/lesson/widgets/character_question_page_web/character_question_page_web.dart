import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_book_app/domain/entities/question_entity.dart';
import 'package:note_book_app/presentation/web_version/lesson/cubits/character_question_page_web/cubit/character_question_page_web_cubit.dart';
import 'package:note_book_app/presentation/web_version/lesson/cubits/character_question_page_web/cubit/character_question_page_web_state.dart';
import 'package:note_book_app/presentation/web_version/lesson/widgets/character_question_page_web/answer_button.dart';

class CharacterQuestionPageWeb extends StatelessWidget {
  final List<QuestionEntity> questions;

  const CharacterQuestionPageWeb({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterQuestionPageWebCubit,
        CharacterQuestionPageWebState>(
      builder: (context, state) {
        if (state is CharacterQuestionPageWebLoaded) {
          final currentQuestion = state.questions[state.currentQuestionIndex];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentQuestion.question,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AnswerButton(
                          answerText: currentQuestion.answers[0],
                          isCorrect: currentQuestion.answers[0] ==
                              currentQuestion.correctAnswer,
                          isSelected: state.selectedAnswer ==
                              currentQuestion.answers[0],
                          onPressed: () {
                            context
                                .read<CharacterQuestionPageWebCubit>()
                                .answerQuestion(currentQuestion.answers[0]);
                          },
                          height: 50,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: AnswerButton(
                          answerText: currentQuestion.answers[1],
                          isCorrect: currentQuestion.answers[1] ==
                              currentQuestion.correctAnswer,
                          isSelected: state.selectedAnswer ==
                              currentQuestion.answers[1],
                          onPressed: () {
                            context
                                .read<CharacterQuestionPageWebCubit>()
                                .answerQuestion(currentQuestion.answers[1]);
                          },
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: AnswerButton(
                          answerText: currentQuestion.answers[2],
                          isCorrect: currentQuestion.answers[2] ==
                              currentQuestion.correctAnswer,
                          isSelected: state.selectedAnswer ==
                              currentQuestion.answers[2],
                          onPressed: () {
                            context
                                .read<CharacterQuestionPageWebCubit>()
                                .answerQuestion(currentQuestion.answers[2]);
                          },
                          height: 50,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: AnswerButton(
                          answerText: currentQuestion.answers[3],
                          isCorrect: currentQuestion.answers[3] ==
                              currentQuestion.correctAnswer,
                          isSelected: state.selectedAnswer ==
                              currentQuestion.answers[3],
                          onPressed: () {
                            context
                                .read<CharacterQuestionPageWebCubit>()
                                .answerQuestion(currentQuestion.answers[3]);
                          },
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        }

        if (state is CharacterQuestionPageWebCompleted) {
          return const Text('You have completed all questions!',
              style: TextStyle(fontSize: 24));
        }

        if (state is CharacterQuestionPageWebFailure) {
          return Text(state.failureMessage,
              style: const TextStyle(color: Colors.red));
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
