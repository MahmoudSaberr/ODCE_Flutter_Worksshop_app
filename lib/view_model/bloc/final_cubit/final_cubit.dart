
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/model/home/exams/exam_model.dart';
import 'package:login/utils/network/remote/dio_helper.dart';
import 'package:login/utils/network/remote/end_points.dart';
import 'package:login/view_model/bloc/final_cubit/final_state.dart';

import '../../../res/constants.dart';

class ExamsCubit extends Cubit<ExamsState> {
  ExamsCubit() : super(ExamsInitial());

  //single instance
  static ExamsCubit get(context) => BlocProvider.of(context);

  ExamModel? examModel;

  Future getExams() async {

    emit(GetExamsLoadingState());

    var token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsInJvbGUiOjQsImlhdCI6MTY2MTg3OTkwOSwiZXhwIjoxNzQ4Mjc5OTA5fQ.ME2mIoddrS2zNiveNhg2cezMxKpqC0j6KUzbxIIcsU0";
    DioHelper.getData(
        url: examsEndPoint,
        token: token
    ).then(
          (value) {
        if (value.statusCode == 200) {
          examModel = ExamModel.fromJson(value.data);
          print(value.data);
          emit(GetExamsSuccessState());
        }
      },
    ).catchError((error){
      print(error.toString());
      emit(GetExamsErrorState(error.toString()));
    });
  }
}
