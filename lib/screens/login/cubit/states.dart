

import 'package:quran_app/models/login.dart';

abstract class QuranLoginStates{}

class QuranLoginInitialState extends QuranLoginStates{}

class QuranLoginLoadingState extends QuranLoginStates{}

class QuranLoginErrorState extends QuranLoginStates{
  final String error;
  QuranLoginErrorState(this.error);
}

class QuranLoginSuccessState extends QuranLoginStates{
  QuranLoginModel loginModel;
  QuranLoginSuccessState(this.loginModel);
}

class ChangeSuffixIconState extends QuranLoginStates{}