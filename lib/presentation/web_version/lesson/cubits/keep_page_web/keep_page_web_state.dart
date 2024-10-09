import 'package:equatable/equatable.dart';
import 'package:note_book_app/domain/entities/question_entity.dart';

abstract class KeepPageWebState extends Equatable {
  const KeepPageWebState();

  @override
  List<Object?> get props => [];
}

final class KeepPageWebInitial extends KeepPageWebState {}

final class KeepPageWebLoading extends KeepPageWebState {}

final class KeepPageWebLoaded extends KeepPageWebState {
  final List<QuestionEntity> questions;

  const KeepPageWebLoaded(this.questions);

  @override
  List<Object?> get props => [questions];
}

final class KeepPageWebError extends KeepPageWebState {
  final String message;

  const KeepPageWebError(this.message);

  @override
  List<Object?> get props => [message];
}
