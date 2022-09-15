import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/utils/network/local/cache_helper.dart';
import 'package:login/utils/network/remote/end_points.dart';
import 'package:meta/meta.dart';

import '../../../model/auth/login/login_model.dart';
import '../../../utils/network/remote/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  void userLogin({
    required String  email,
    required String password,
  })
  {
    emit(LoginLoadingState());

    DioHelper.postData(
      url: loginEndPoint,
      data:
      {
        'email': email,
        'password': password,
      },
    ).then((value)
    {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      CacheHelper.saveString(key: "token", value: loginModel!.data!.accessToken);

      emit(LoginSuccessState(loginModel!));
    }).catchError((error)
    {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(ChangePasswordVisibilityState());
  }

}
