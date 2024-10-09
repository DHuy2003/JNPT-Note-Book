import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:note_book_app/core/failures/failure.dart';
import 'package:note_book_app/domain/entities/question_entity.dart';
import 'package:note_book_app/domain/usecases/characters/create_character_question_usecase.dart';
import 'package:note_book_app/presentation/web_version/lesson/cubits/keep_page_web/keep_page_web_state.dart';
import 'package:note_book_app/core/services/get_it_service.dart';

class KeepPageWebCubit extends Cubit<KeepPageWebState> {
  final CreateCharacterQuestionUsecase createCharacterQuestionUsecase =
      getIt<CreateCharacterQuestionUsecase>();

  KeepPageWebCubit() : super(KeepPageWebInitial());

  Future<void> selectQuestionType({
    required String questionType,
    required String answerType,
    required int numberOfQuestions,
  }) async {
    emit(KeepPageWebLoading());

    final Either<Failure, List<QuestionEntity>> result =
        await createCharacterQuestionUsecase(
      numberOfQuestions: numberOfQuestions,
      questionType: questionType,
      answerType: answerType,
    );

    result.fold(
      (failure) => emit(const KeepPageWebError("Failed to load questions")),
      (questions) => emit(KeepPageWebLoaded(questions)),
    );
  }
}
