  import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/dio/dio_helper/dio_helper.dart';
import 'package:quran_app/dio/dio_helper/end_points.dart';
import 'package:quran_app/models/login.dart';

import 'states.dart';

class QuranLoginCubit extends Cubit<QuranLoginStates>
{
  QuranLoginCubit() : super(QuranLoginInitialState());

  static QuranLoginCubit get(context) => BlocProvider.of(context);

  bool isVisible = true;
   QuranLoginModel? quranLoginModel;
  void changeSuffixIcon()
  {
    isVisible =! isVisible;
    emit(ChangeSuffixIconState());
  }

  void userLogin({
    required String email,
    required String password,
  })
  {
    emit(QuranLoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        "email":email,
        "password":password,
      },
    ).then((value)
    {
      print(value.data);
      quranLoginModel= QuranLoginModel.fromJson(value.data);
      emit(QuranLoginSuccessState(quranLoginModel!));
    }).catchError((error)
    {
      print("error in userlogin ${error.toString()}");
      emit(QuranLoginErrorState(error.toString()));
    });

  }

}