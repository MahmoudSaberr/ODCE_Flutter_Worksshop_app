part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends  RegisterState
{
}

class RegisterErrorState extends RegisterState
{
  final String error;

  RegisterErrorState(this.error);
}

class ChangePasswordVisibilityState extends RegisterState {}
class ChangePasswordConfirmVisibilityState extends RegisterState {}

class SelectItemState extends RegisterState {}

class GetUniversitiesLoadingState extends RegisterState {}

class GetUniversitiesSuccessState extends RegisterState {}

class GetUniversitiesErrorState extends RegisterState
{
  final String error;

  GetUniversitiesErrorState(this.error);
}
class GetGradeLoadingState extends RegisterState {}

class GetGradeSuccessState extends RegisterState {}

class GetGradeErrorState extends RegisterState
{
  final String error;

  GetGradeErrorState(this.error);
}
