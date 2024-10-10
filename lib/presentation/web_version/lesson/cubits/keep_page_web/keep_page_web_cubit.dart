import 'package:bloc/bloc.dart';
import 'package:note_book_app/domain/usecases/characters/create_character_question_usecase.dart';
import 'package:note_book_app/presentation/web_version/lesson/cubits/character_page_web/character_page_web_cubit.dart';
import 'package:note_book_app/presentation/web_version/lesson/cubits/character_page_web/character_page_web_state.dart';
import 'package:note_book_app/presentation/web_version/lesson/cubits/keep_page_web/keep_page_web_state.dart';
import 'package:note_book_app/core/services/get_it_service.dart';

class KeepPageWebCubit extends Cubit<KeepPageWebState> {
  final CreateCharacterQuestionUsecase createCharacterQuestionUsecase =
      getIt<CreateCharacterQuestionUsecase>();

  final CharacterPageWebCubit characterPageWebCubit;

  KeepPageWebCubit(this.characterPageWebCubit) : super(KeepPageWebInitial());

  Future<void> selectQuestionType({
    required String questionType,
    required String answerType,
    required int numberOfQuestions,
  }) async {
    emit(KeepPageWebLoading());

    await characterPageWebCubit.selectQuestionType(
      questionType: questionType,
      answerType: answerType,
      numberOfQuestions: numberOfQuestions,
    );

    final state = characterPageWebCubit.state;
    if (state is CharacterPageWebQuestionLoaded) {
      emit(KeepPageWebLoaded(state.questions));
    }
  }
}
