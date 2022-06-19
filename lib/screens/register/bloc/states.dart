

import 'package:quran_app/models/login.dart';

abstract class QuranRegisterStates{}

class RegisterInitialState extends QuranRegisterStates{}

class RegisterLoadingState extends  QuranRegisterStates{}

class RegisterErrorState extends QuranRegisterStates{
  final String error;
  RegisterErrorState(this.error);
}

class RegisterSuccessState extends QuranRegisterStates{
  QuranLoginModel loginModel;
  RegisterSuccessState(this.loginModel);
}
class UserCreateErrorState extends QuranRegisterStates{
  final String error;
  UserCreateErrorState(this.error);
}

class UserCreateSuccessState extends QuranRegisterStates{

}

class ChangeSuffixIconRegisterState extends QuranRegisterStates{}