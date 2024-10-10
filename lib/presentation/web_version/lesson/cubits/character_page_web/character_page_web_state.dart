import 'package:equatable/equatable.dart';
import 'package:note_book_app/domain/entities/character_entity.dart';
import 'package:note_book_app/domain/entities/question_entity.dart';

abstract class CharacterPageWebState extends Equatable {
  const CharacterPageWebState();

  @override
  List<Object?> get props => [];
}

class CharacterPageWebInitial extends CharacterPageWebState {}

class CharacterPageWebLoading extends CharacterPageWebState {}

class CharacterPageWebLoaded extends CharacterPageWebState {
  final String characterType;
  final List<CharacterEntity> characters;

  const CharacterPageWebLoaded(
      {required this.characters, required this.characterType});

  @override
  List<Object?> get props => [characters, characterType];
}

class CharacterPageWebKeepPage extends CharacterPageWebState {}

class CharacterPageWebQuestionLoaded extends CharacterPageWebState {
  final List<QuestionEntity> questions;

  const CharacterPageWebQuestionLoaded({required this.questions});

  @override
  List<Object?> get props => [questions];
}

class CharacterPageWebFailure extends CharacterPageWebState {
  final String failureMessage;

  const CharacterPageWebFailure({required this.failureMessage});

  @override
  List<Object?> get props => [failureMessage];
}
