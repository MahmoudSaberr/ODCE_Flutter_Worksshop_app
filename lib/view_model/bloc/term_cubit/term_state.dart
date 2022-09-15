part of 'term_cubit.dart';

@immutable
abstract class TermState {}

class TermInitial extends TermState {}

class GetTermSuccessState extends TermState {}

class GetTermsErrorState extends TermState {
  final String error;

  GetTermsErrorState(this.error);
}

class GetTermLoadingState extends TermState {}
