part of 'review_questions_page_cubit.dart';

sealed class ReviewQuestionsPageState extends Equatable {
  const ReviewQuestionsPageState();

  @override
  List<Object?> get props => [];
}

final class ReviewQuestionsPageInitial extends ReviewQuestionsPageState {}

final class ReviewQuestionsPageLoaded extends ReviewQuestionsPageState {
  final String question;
  final List<String> options;
  final String correctAnswer;
  final bool hasAnswered;
  final int selectedOptionIndex;
  final String questionType;

  const ReviewQuestionsPageLoaded({
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.hasAnswered,
    required this.selectedOptionIndex,
    required this.questionType,
  });

  @override
  List<Object?> get props => [
        question,
        options,
        correctAnswer,
        hasAnswered,
        selectedOptionIndex,
        questionType,
      ];

  ReviewQuestionsPageLoaded copyWith({
    String? question,
    List<String>? options,
    String? correctAnswer,
    bool? hasAnswered,
    int? selectedOptionIndex,
    String? questionType,
  }) {
    return ReviewQuestionsPageLoaded(
      question: question ?? this.question,
      options: options ?? this.options,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      hasAnswered: hasAnswered ?? this.hasAnswered,
      selectedOptionIndex: selectedOptionIndex ?? this.selectedOptionIndex,
      questionType: questionType ?? this.questionType,
    );
  }
}
