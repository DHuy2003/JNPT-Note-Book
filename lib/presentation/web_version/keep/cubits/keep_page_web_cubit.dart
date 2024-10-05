import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'keep_page_web_state.dart';

class KeepPageWebCubit extends Cubit<KeepPageWebState> {
  KeepPageWebCubit() : super(KeepPageWebInitial());

  void selectQuestionType(String questionType) {
    emit(KeepPageWebSelected(questionType));
  }
}
