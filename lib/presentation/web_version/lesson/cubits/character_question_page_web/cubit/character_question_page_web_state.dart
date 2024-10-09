part of 'character_question_page_web_cubit.dart';

abstract class CharacterQuestionPageWebState extends Equatable {
  const CharacterQuestionPageWebState();

  @override
  List<Object?> get props => [];
}

final class CharacterQuestionPageWebInitial extends CharacterQuestionPageWebState {}

final class CharacterQuestionPageWebLoading extends CharacterQuestionPageWebState {}

final class CharacterQuestionPageWebLoaded extends CharacterQuestionPageWebState {
  final List<QuestionEntity> questions;

  const CharacterQuestionPageWebLoaded(this.questions);

  @override
  List<Object?> get props => [questions];
}

final class CharacterQuestionPageWebError extends CharacterQuestionPageWebState {
  final String message;

  const CharacterQuestionPageWebError(this.message);

  @override
  List<Object?> get props => [message];
}