import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_book_app/common/colors/app_colors.dart';
import 'package:note_book_app/presentation/web_version/review_questions/cubits/review_questions_page_cubit.dart';
import 'package:note_book_app/presentation/web_version/review_questions/widgets/answer_button.dart';
import 'package:note_book_app/common/utils/responsive_util.dart';

class ReviewQuestionsPageWeb extends StatelessWidget {
  final String questionType;

  const ReviewQuestionsPageWeb({super.key, required this.questionType});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewQuestionsPageCubit(questionType),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.k8D493A,
        ),
        body: BlocBuilder<ReviewQuestionsPageCubit, ReviewQuestionsPageState>(
          builder: (context, state) {
            if (state is ReviewQuestionsPageLoaded) {
              bool isMobile = ResponsiveUtil.isMobile(context);
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'What is the ${state.questionType == 'Hiragana' || state.questionType == 'Katakana' ? 'Romanji' : 'corresponding character'} for "${state.question}" ?',
                        style: const TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (isMobile)
                      Column(
                        children: List.generate(state.options.length, (index) {
                          return AnswerButton(
                            answerText: state.options[index],
                            isCorrect:
                                state.options[index] == state.correctAnswer,
                            isSelected: state.selectedOptionIndex == index &&
                                state.hasAnswered,
                            onPressed: () => context
                                .read<ReviewQuestionsPageCubit>()
                                .handleAnswerSelection(
                                  index,
                                  state.correctAnswer,
                                  state.options[index],
                                ),
                            height: 48,
                          );
                        }),
                      )
                    else
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: AnswerButton(
                                  answerText: state.options[0],
                                  isCorrect:
                                      state.options[0] == state.correctAnswer,
                                  isSelected: state.selectedOptionIndex == 0 &&
                                      state.hasAnswered,
                                  onPressed: () => context
                                      .read<ReviewQuestionsPageCubit>()
                                      .handleAnswerSelection(
                                        0,
                                        state.correctAnswer,
                                        state.options[0],
                                      ),
                                  height: 48,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: AnswerButton(
                                  answerText: state.options[1],
                                  isCorrect:
                                      state.options[1] == state.correctAnswer,
                                  isSelected: state.selectedOptionIndex == 1 &&
                                      state.hasAnswered,
                                  onPressed: () => context
                                      .read<ReviewQuestionsPageCubit>()
                                      .handleAnswerSelection(
                                        1,
                                        state.correctAnswer,
                                        state.options[1],
                                      ),
                                  height: 48,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: AnswerButton(
                                  answerText: state.options[2],
                                  isCorrect:
                                      state.options[2] == state.correctAnswer,
                                  isSelected: state.selectedOptionIndex == 2 &&
                                      state.hasAnswered,
                                  onPressed: () => context
                                      .read<ReviewQuestionsPageCubit>()
                                      .handleAnswerSelection(
                                        2,
                                        state.correctAnswer,
                                        state.options[2],
                                      ),
                                  height: 48,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: AnswerButton(
                                  answerText: state.options[3],
                                  isCorrect:
                                      state.options[3] == state.correctAnswer,
                                  isSelected: state.selectedOptionIndex == 3 &&
                                      state.hasAnswered,
                                  onPressed: () => context
                                      .read<ReviewQuestionsPageCubit>()
                                      .handleAnswerSelection(
                                        3,
                                        state.correctAnswer,
                                        state.options[3],
                                      ),
                                  height: 48,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
