import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:quran_app/cubit/cubit.dart';
import 'package:quran_app/dio/dio_helper/dio_adan_time.dart';
import 'package:quran_app/dio/dio_helper/dio_helper.dart';
import 'package:quran_app/layout/layout_screen.dart';
import 'package:quran_app/screens/adan_screen/bloc/cubit.dart';
import 'package:quran_app/screens/quran_screen.dart';
import 'package:quran_app/screens/splash_screen.dart';
  import 'dio/dio_helper/dio_data.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  DioDataHelper.init();
  DioAdanHelper.int();
  runApp(  const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context)=>QuranAppCubit()..getData()..readJsonFehresData()),
        BlocProvider(
            create: (context)=>AdanTimeCubit()..getAdanTimeData(
                city: "Cairo",
                country: "Egypt",
                method: 8,
            )),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', 'AE'), // English, no country code
        ],
        theme: ThemeData(
          primaryColor: Colors.deepOrange,

        ),
        debugShowCheckedModeBanner: false,
        home:  const  SplashScreen(),
      ),
    );
  }
}
