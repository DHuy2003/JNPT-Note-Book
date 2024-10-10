import 'package:equatable/equatable.dart';
import 'package:note_book_app/domain/entities/question_entity.dart';

abstract class CharacterQuestionPageWebState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CharacterQuestionPageWebInitial extends CharacterQuestionPageWebState {}

class CharacterQuestionPageWebLoaded extends CharacterQuestionPageWebState {
  final int currentQuestionIndex;
  final List<QuestionEntity> questions;
  final String? selectedAnswer;

  CharacterQuestionPageWebLoaded({
    required this.currentQuestionIndex,
    required this.questions,
    this.selectedAnswer,
  });

  @override
  List<Object?> get props => [currentQuestionIndex, questions, selectedAnswer];
}

class CharacterQuestionPageWebCompleted extends CharacterQuestionPageWebState {}

class CharacterQuestionPageWebFailure extends CharacterQuestionPageWebState {
  final String failureMessage;

  CharacterQuestionPageWebFailure(this.failureMessage);

  @override
  List<Object?> get props => [failureMessage];
}
