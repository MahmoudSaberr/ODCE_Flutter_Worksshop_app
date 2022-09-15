
abstract class NewsState {}

class NewsInitial extends NewsState {}

class GetNewsSuccessState extends NewsState {}

class GetNewsErrorState extends NewsState {
  final String error;

  GetNewsErrorState(this.error);
}

class GetNewsLoadingState extends NewsState {}


