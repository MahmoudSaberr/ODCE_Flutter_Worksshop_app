

abstract class ExamsState {}

class ExamsInitial extends ExamsState {}

class GetExamsSuccessState extends ExamsState {}

class GetExamsErrorState extends ExamsState {
  final String error;

  GetExamsErrorState(this.error);
}

class GetExamsLoadingState extends ExamsState {}


