
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/model/home/lectures/lecture_model.dart';
import 'package:login/utils/network/remote/dio_helper.dart';
import 'package:login/utils/network/remote/end_points.dart';

import '../../../res/constants.dart';
import '../../../utils/network/local/cache_helper.dart';

part 'lectures_state.dart';

class LecturesCubit extends Cubit<LecturesState> {
  LecturesCubit() : super(LecturesInitial());

  //single instance
  static LecturesCubit get(context) => BlocProvider.of(context);

  LectureModel? lectureModel;
  Data? data;

  Future getLectures() async {

    emit(GetLecturesLoadingState());
    var token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDEsInJvbGUiOjQsImlhdCI6MTY2Mjk4MjE5NCwiZXhwIjoxNzQ5MzgyMTk0fQ.gD0pxtdsO1gPRnrpv4Mh2EJPqf-BxxL7fosY-B_BNag";

    DioHelper.getData(
        url: lectureEndPoint,
        token: CacheHelper.getData(key: 'token')
    ).then(
          (value) {
        if (value.statusCode == 200) {
          lectureModel = LectureModel.fromJson(value.data);
          print(value.data);
          emit(GetLecturesSuccessState());
        }
      },
    ).catchError((error){
      print(error.toString());
      emit(GetLecturesErrorState(error.toString()));
    });
  }
}
