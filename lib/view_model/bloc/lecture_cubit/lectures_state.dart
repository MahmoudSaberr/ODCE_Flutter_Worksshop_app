part of 'lectures_cubit.dart';

abstract class LecturesState {}

class LecturesInitial extends LecturesState {}

class GetLecturesSuccessState extends LecturesState {}

class GetLecturesErrorState extends LecturesState {
  final String error;

  GetLecturesErrorState(this.error);
}

class GetLecturesLoadingState extends LecturesState {}


