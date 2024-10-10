import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_book_app/core/failures/failure.dart';
import 'package:note_book_app/core/services/get_it_service.dart';
import 'package:note_book_app/domain/entities/question_entity.dart';
import 'package:note_book_app/domain/usecases/characters/create_character_question_usecase.dart';
import 'package:note_book_app/domain/usecases/characters/get_all_characters_usecase.dart';
import 'package:note_book_app/presentation/web_version/lesson/cubits/character_page_web/character_page_web_state.dart';

class CharacterPageWebCubit extends Cubit<CharacterPageWebState> {
  final GetAllCharactersUsecase _getAllCharactersUsecase =
      getIt<GetAllCharactersUsecase>();

  final CreateCharacterQuestionUsecase _createCharacterQuestionUsecase =
      getIt<CreateCharacterQuestionUsecase>();

  CharacterPageWebCubit() : super(CharacterPageWebInitial());

  void getAllCharacters({required String characterType}) async {
    emit(CharacterPageWebLoading());
    final result = await _getAllCharactersUsecase.call();
    result.fold(
      (failure) =>
          emit(CharacterPageWebFailure(failureMessage: failure.message)),
      (characters) => emit(CharacterPageWebLoaded(
        characters: characters,
        characterType: characterType,
      )),
    );
  }

  Future<void> selectQuestionType({
    required String questionType,
    required String answerType,
    required int numberOfQuestions,
  }) async {
    emit(CharacterPageWebLoading());

    final Either<Failure, List<QuestionEntity>> result =
        await _createCharacterQuestionUsecase(
      numberOfQuestions: numberOfQuestions,
      questionType: questionType,
      answerType: answerType,
    );

    result.fold(
      (failure) =>
          emit(CharacterPageWebFailure(failureMessage: failure.message)),
      (questions) => emit(CharacterPageWebQuestionLoaded(questions: questions)),
    );
  }

  void showKeepPageWeb() {
    emit(CharacterPageWebKeepPage());
  }
}
