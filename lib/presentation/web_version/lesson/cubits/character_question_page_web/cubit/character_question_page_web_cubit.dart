import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:note_book_app/core/failures/failure.dart';
import 'package:note_book_app/core/services/get_it_service.dart';
import 'package:note_book_app/domain/entities/question_entity.dart';
import 'package:note_book_app/domain/usecases/characters/create_character_question_usecase.dart';

part 'character_question_page_web_state.dart';

class CharacterQuestionPageWebCubit extends Cubit<CharacterQuestionPageWebState> {
  final CreateCharacterQuestionUsecase createCharacterQuestionUsecase = getIt<CreateCharacterQuestionUsecase>();

  CharacterQuestionPageWebCubit()
      : super(CharacterQuestionPageWebInitial());

  Future<void> loadQuestions(int numberOfQuestions, String questionType, String answerType) async {
    emit(CharacterQuestionPageWebLoading());
    final Either<Failure, List<QuestionEntity>> result = await createCharacterQuestionUsecase(
      numberOfQuestions: numberOfQuestions,
      questionType: questionType,
      answerType: answerType,
    );
    result.fold(
      (failure) => emit(const CharacterQuestionPageWebError('Failed to load questions')),
      (questions) => emit(CharacterQuestionPageWebLoaded(questions)),
    );
  }
}
