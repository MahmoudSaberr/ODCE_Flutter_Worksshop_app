import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/model/auth/registration/register_model.dart';
import 'package:login/utils/network/remote/dio_helper.dart';
import 'package:login/utils/network/remote/end_points.dart';
import 'package:meta/meta.dart';

import '../../../utils/network/local/cache_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  bool autoValidate = false;
  bool? isLoading  = true;


  SignUpModel? signUpModel;

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String gender,
    required String universityId,
    required String gradeId,
  })
  {
    emit(RegisterLoadingState());

    DioHelper.postData(
      url: registerEndPoint,
      data:
      {
        'name': name,
        'email': email,
        'password': password,
        'gender': "m",
        'phoneNumber': phoneNumber,
        'universityId': 1,
        'gradeId': 4,
        'roleId': 2,
      },
    ).then((value)
    {
      print(value.data);
      signUpModel = SignUpModel.fromJson(value.data);
      bool? isLoading  = false;
      emit(RegisterSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  UniversityModel universityModel = UniversityModel();

  Future getUniversitiesData() async{
    emit(GetUniversitiesLoadingState());

    DioHelper.getData(
      url: universityEndPoint,
      token:CacheHelper.getData(key: 'token'),
    ).then((value) {
      if (value.statusCode == 200) {
        universityModel = UniversityModel.fromJson(json: value.data);
        print(value.data);
        emit(GetUniversitiesSuccessState());
      }
    }).catchError((error) {
      print(error.toString());
      emit(GetUniversitiesErrorState(error));
    });
  }


  GradeModel gradeModel = GradeModel();

  Future getGradesData() async{
    emit(GetGradeLoadingState());

    DioHelper.getData(
      url: gradeEndPoint,
      token:CacheHelper.getData(key: 'token'),
    ).then((value) {
      if (value.statusCode == 200) {
        gradeModel = GradeModel.fromJson(value.data);
        print(value.data);
        emit(GetGradeSuccessState());
      }
    }).catchError((error) {
      print(error.toString());
      emit(GetGradeErrorState(error));
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

  IconData suffixConfirm = Icons.visibility_outlined;
  bool isPasswordConfirm = true;

  void changePasswordConfirmVisibility()
  {
    isPasswordConfirm = !isPasswordConfirm;
    suffixConfirm = isPasswordConfirm ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(ChangePasswordConfirmVisibilityState());
  }

  List<String> genderItems = [
    'Male',
    'Female'
  ];
  String? selectedItem;

  void selectItem(selected)
  {
    selectedItem = selected;
    print(selectedItem);
    emit(SelectItemState());
  }
  String? selectedUni;

  void selectUni(selected)
  {
    selectedUni = selected;
    print(selectedUni);
    emit(SelectItemState());
  }
  String? selectedGrade;

  void selectGrade(selected)
  {
    selectedGrade = selected;
    print(selectedGrade);
    emit(SelectItemState());
  }

}
