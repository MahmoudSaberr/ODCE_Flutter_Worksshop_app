
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/model/home/sections/section_model.dart';
import 'package:login/utils/network/remote/dio_helper.dart';
import 'package:login/utils/network/remote/end_points.dart';
import 'package:login/view_model/bloc/section_cubit/sections_state.dart';

import '../../../res/constants.dart';
import '../../../utils/network/local/cache_helper.dart';

class SectionsCubit extends Cubit<SectionsState> {
  SectionsCubit() : super(SectionsInitial());

  //single instance
  static SectionsCubit get(context) => BlocProvider.of(context);

  SectionModel? sectionModel;

  Future getSections() async {

    emit(GetSectionsLoadingState());
    var token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsInJvbGUiOjQsImlhdCI6MTY2MTg3OTkwOSwiZXhwIjoxNzQ4Mjc5OTA5fQ.ME2mIoddrS2zNiveNhg2cezMxKpqC0j6KUzbxIIcsU0";
    DioHelper.getData(
        url: sectionEndPoint,
        token: CacheHelper.getData(key: 'token')
    ).then(
          (value) {
        if (value.statusCode == 200) {
          sectionModel = SectionModel.fromJson(value.data);
          print(value.data);
          emit(GetSectionsSuccessState());
        }
      },
    ).catchError((error){
      print(error.toString());
      emit(GetSectionsErrorState(error.toString()));
    });
  }
}
