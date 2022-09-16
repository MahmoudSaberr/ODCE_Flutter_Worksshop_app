
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/model/bar_options/news/news_model.dart';
import 'package:login/res/constants.dart';
import 'package:login/utils/network/local/cache_helper.dart';
import 'package:login/utils/network/remote/dio_helper.dart';
import 'package:login/utils/network/remote/end_points.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  //single instance
  static NewsCubit get(context) => BlocProvider.of(context);
  NewsModel? newsModel;

  Future getNewsData() async{
    emit(GetNewsLoadingState());

    DioHelper.getData(
      url: newsEndPoint,
      token:CacheHelper.getData(key: 'token'),
    ).then((value) {
      if (value.statusCode == 200) {
        newsModel = NewsModel.fromJson(value.data);
        print(value.data);
        emit(GetNewsSuccessState());
      }
    }).catchError((error) {
      print(error.toString());
      emit(GetNewsErrorState(error));
    });
  }

}
