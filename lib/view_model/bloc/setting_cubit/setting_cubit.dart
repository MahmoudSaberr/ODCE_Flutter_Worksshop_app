
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../utils/network/local/cache_helper.dart';
import '../../../view/pages/auth/login_screen.dart';
import 'setting_state.dart';


class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());

  //single instance
  static SettingCubit get(context) => BlocProvider.of(context);
  bool isLoading = true;

  SignOut(context){

    emit(GetData());
  }

}