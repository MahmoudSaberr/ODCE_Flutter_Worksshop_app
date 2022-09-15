import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/model/bar_options/settings/terms/term_model.dart';
import 'package:login/utils/network/remote/dio_helper.dart';
import 'package:login/utils/network/remote/end_points.dart';
import 'package:meta/meta.dart';

import '../../../res/constants.dart';

part 'term_state.dart';


class TermCubit extends Cubit<TermState> {
  TermCubit() : super(TermInitial());
  static TermCubit get(context) => BlocProvider.of(context);

  TermModel? termModel;
  bool? isLoading  = true;

  Future getTerms() async {
    emit(GetTermLoadingState());

    var token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsInJvbGUiOjQsImlhdCI6MTY2MTg3OTkwOSwiZXhwIjoxNzQ4Mjc5OTA5fQ.ME2mIoddrS2zNiveNhg2cezMxKpqC0j6KUzbxIIcsU0";
    DioHelper.getData(
        url: termsEndPoint,
        token: token
    ).then(
          (value) {
        if (value.statusCode == 200) {
          termModel = TermModel.fromJson(value.data);
          print(value.data);
          isLoading = false;
          emit(GetTermSuccessState());
        }
      },
    ).catchError((error){
      print(error.toString());
      emit(GetTermsErrorState(error.toString()));
    });
  }



}
