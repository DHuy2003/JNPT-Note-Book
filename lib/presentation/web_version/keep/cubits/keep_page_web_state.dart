part of 'keep_page_web_cubit.dart';

sealed class KeepPageWebState extends Equatable {
  const KeepPageWebState();

  @override
  List<Object?> get props => [];
}

final class KeepPageWebInitial extends KeepPageWebState {}

final class KeepPageWebSelected extends KeepPageWebState {
  final String questionType;

  const KeepPageWebSelected(this.questionType);

  @override
  List<Object?> get props => [questionType];
}
