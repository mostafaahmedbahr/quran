    import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/dio/dio_helper/dio_helper.dart';
import 'package:quran_app/models/login.dart';


import '../../../dio/dio_helper/end_points.dart';
import 'states.dart';

class QuranRegisterCubit extends Cubit<QuranRegisterStates> {
  QuranRegisterCubit() : super(RegisterInitialState());

  static QuranRegisterCubit get(context) => BlocProvider.of(context);

  bool isVisible = true;
  QuranLoginModel? quranLoginModel;

  void changeSuffixIcon() {
    isVisible = !isVisible;
    emit(ChangeSuffixIconRegisterState());
  }

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data:
      {
        "email":email,
        "password":password,
        "phone":phone,
        "name":name,
      },
    ).then((value)
    {
      print(value.data);
      quranLoginModel= QuranLoginModel.fromJson(value.data);
      emit(RegisterSuccessState(quranLoginModel!));
    }).catchError((error)
    {
      print("error in user register ${error.toString()}");
      emit(RegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String email,
    required String uId,
    required String name,
    required String phone,
  }) {

  }
}
