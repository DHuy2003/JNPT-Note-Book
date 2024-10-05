import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:math';

part 'review_questions_page_state.dart';

class ReviewQuestionsPageCubit extends Cubit<ReviewQuestionsPageState> {
  final Map<String, Map<String, String>> data = {
    'Hiragana': {'あ': 'a', 'い': 'i', 'う': 'u', 'え': 'e', 'お': 'o'},
    'Katakana': {'ア': 'a', 'イ': 'i', 'ウ': 'u', 'エ': 'e', 'オ': 'o'},
    'RomanjiToHiragana': {'a': 'あ', 'i': 'い', 'u': 'う', 'e': 'え', 'o': 'お'},
    'RomanjiToKatakana': {'a': 'ア', 'i': 'イ', 'u': 'ウ', 'e': 'エ', 'o': 'オ'}
  };

  final String questionType; // Thêm biến này để lưu trữ loại câu hỏi

  ReviewQuestionsPageCubit(this.questionType)
      : super(ReviewQuestionsPageInitial()) {
    _generateQuestion();
  }

  void _generateQuestion() {
    var currentData = data[questionType]!;
    var random = Random();
    List<String> keys = currentData.keys.toList();

    String question = keys[random.nextInt(keys.length)];
    String correctAnswer = currentData[question]!;

    Set<String> wrongAnswers = {};
    while (wrongAnswers.length < 3) {
      var wrongKey = keys[random.nextInt(keys.length)];
      if (wrongKey != question) {
        wrongAnswers.add(currentData[wrongKey]!);
      }
    }

    List<String> options = [correctAnswer, ...wrongAnswers].toList();
    options.shuffle();

    emit(ReviewQuestionsPageLoaded(
      question: question,
      options: options,
      correctAnswer: correctAnswer,
      hasAnswered: false,
      selectedOptionIndex: -1,
      questionType: questionType, // Truyền questionType vào trạng thái
    ));
  }

  void handleAnswerSelection(
      int index, String correctAnswer, String selectedAnswer) {
    bool isCorrect = correctAnswer == selectedAnswer;

    if (isCorrect) {
      emit((state as ReviewQuestionsPageLoaded).copyWith(
        hasAnswered: true,
        selectedOptionIndex: index,
      ));
      Future.delayed(const Duration(seconds: 1), () {
        _generateQuestion();
      });
    } else {
      emit((state as ReviewQuestionsPageLoaded).copyWith(
        hasAnswered: true,
        selectedOptionIndex: index,
      ));
      Future.delayed(const Duration(seconds: 1), () {
        emit((state as ReviewQuestionsPageLoaded).copyWith(
          hasAnswered: false,
          selectedOptionIndex: -1,
        ));
      });
    }
  }
}
