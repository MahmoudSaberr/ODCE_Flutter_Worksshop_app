
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/bar_options/settings/faqs/faqs_model.dart';
import '../../../utils/network/remote/dio_helper.dart';
import '../../../utils/network/remote/end_points.dart';
import 'faqs_state.dart';


class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqInitial());

  //single instance
  static FaqCubit get(context) => BlocProvider.of(context);
  bool isLoading = true;
  FaqModel? data;

  Future getData() async {
    emit(GetLoadingData());
    var token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDgsInJvbGUiOjQsImlhdCI6MTY2MzA4ODcwNSwiZXhwIjoxNzQ5NDg4NzA1fQ.hy296nDyXCLHk3NyGasrVTb4bWF2DVp22csad1uKW40";
    DioHelper.getData(url: faqEndPoint, token: token).then(
          (value) {
        if (value.statusCode == 200) {
          data = FaqModel.fromJson(value.data);
          print(value.data);
          isLoading = false;
          emit(GetData());
        }
      },
    );
    emit(GetData());
  }
}