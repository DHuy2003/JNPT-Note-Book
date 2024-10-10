import 'package:bloc/bloc.dart';
import 'package:note_book_app/domain/entities/question_entity.dart';
import 'character_question_page_web_state.dart';

class CharacterQuestionPageWebCubit
    extends Cubit<CharacterQuestionPageWebState> {
  CharacterQuestionPageWebCubit() : super(CharacterQuestionPageWebInitial());

  List<QuestionEntity> _questions = [];

  void loadQuestions(List<QuestionEntity> questions) {
    _questions = questions;
    if (_questions.isNotEmpty) {
      emit(CharacterQuestionPageWebLoaded(
        currentQuestionIndex: 0,
        questions: _questions,
      ));
    } else {
      emit(CharacterQuestionPageWebFailure('No questions available.'));
    }
  }

  void answerQuestion(String answer) async {
    final currentState = state as CharacterQuestionPageWebLoaded;

    if (currentState.currentQuestionIndex < currentState.questions.length) {
      bool isCorrect = answer ==
          currentState
              .questions[currentState.currentQuestionIndex].correctAnswer;

      emit(CharacterQuestionPageWebLoaded(
        questions: currentState.questions,
        currentQuestionIndex: currentState.currentQuestionIndex,
        selectedAnswer: answer,
      ));

      await Future.delayed(const Duration(seconds: 1));

      if (isCorrect) {
        if (currentState.currentQuestionIndex + 1 <
            currentState.questions.length) {
          emit(CharacterQuestionPageWebLoaded(
            questions: currentState.questions,
            currentQuestionIndex: currentState.currentQuestionIndex + 1,
          ));
        } else {
          emit(CharacterQuestionPageWebCompleted());
        }
      } else {
        emit(CharacterQuestionPageWebLoaded(
          questions: currentState.questions,
          currentQuestionIndex: currentState.currentQuestionIndex,
        ));
      }
    }
  }
}
