import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/dio/sh_pre/cache_helper.dart';
import 'package:quran_app/screens/splash_screen.dart';

import '../utils/navbar.dart';

void SignOut(BuildContext context)
{
  SharedPreferencesHelper.removeData(
      key: "token").then((value)
  {
    if(value)
    {
      AppNav.customNavigator(
        context: context,
        screen:   const SplashScreen(),
        finish: true,
      );
    }
  });
}

