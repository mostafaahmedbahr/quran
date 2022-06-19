
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quran_app/dio/dio_helper/dio_data.dart';
import 'package:quran_app/models/data_detail_model.dart';
import 'package:quran_app/models/data_model.dart';
import 'package:quran_app/models/fehres_model.dart';
import 'package:quran_app/models/surah_data_model.dart';
import 'package:quran_app/screens/alaidhikar.dart';
 import 'package:quran_app/screens/misbaha/misbaha_spash.dart';
import 'package:quran_app/screens/new_qiblah/new_qubla.dart';
import 'package:quran_app/widgets/card_item.dart';
  import '../screens/adan_screen/adan_screen.dart';
import '../screens/quran_screen.dart';
 import 'states.dart';
//
import 'package:flutter/services.dart' as rootBundle;

 class QuranAppCubit extends Cubit<QuranAppStates> {
  QuranAppCubit() : super(QuranAppInitialState());

  static QuranAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  bool isClicked = false;
  List iconsList =[];
  int oldIndex = 0;
  String name = "ألله أكبر";
  AudioPlayer audioPlayer = AudioPlayer();
  bool playSound = true;
  play(String c) async {
    int result = await audioPlayer.play(c);
    if (result == 1) {
      // success
    }
  }

  MainTitlesModel? mainTitlesModel;
  DataDetailModel? dataDetailModel;
  FehresModel? fehresModel;

  List<Widget> screens = [
    const AdanScreen(),
    const MisbahaSplashScreen(),
    NewQiblah(),
    const QuranScreen(),
    Alaidhikar(),

  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(QuranAppChangeBottomNavBar());
  }



  void getData()
  {
    emit(QuranGetDataLoadingState());
    DioDataHelper.getData(
      url:"http://www.hisnmuslim.com/api/ar/husn_ar.json",
    ).then((value)
    {
      print(value.data);
      mainTitlesModel = MainTitlesModel.fromJson(value.data);
      print(mainTitlesModel?.arabic);
      emit(QuranGetDataSuccessState());
    }).catchError((error)
    {
      print("error in getMainData ${error.toString()}");
      emit( QuranGetDataErrorState());
    });
  }

  void getDetailData(int id)
  {
    emit(GetaDetilDataLoadingState());
     DioDataHelper.getData(
      //id
      url:"http://www.hisnmuslim.com/api/ar/$id.json",
    ).then((value)
    {
      print(value.data);
      dataDetailModel = DataDetailModel.fromJson(value.data);
      print(dataDetailModel?.detailData);
      emit(GetDetailDataSuccessState());
    }).catchError((error)
    {
      print("error in getOneData ${error.toString()}");
      emit( GetDetilDataLErrorState());
    });
  }


  Future<List<Data1>> readJsonFehresData() async {
    //read json file
    final jsondata = await rootBundle.rootBundle.loadString('assets/fehres.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => Data1.fromJson(e)).toList();

  }

  Future<List<Ayahs>?> readJsonSurahData(int number) async {
    //read json file
    final jsondata = await rootBundle.rootBundle.loadString('assets/Quran/s$number.json');
    //decode json data as list
    final parsed = json.decode(jsondata) ;
    print(parsed);
   final surah = SurahDataModel.fromJson(parsed);
   print(surah);
    //map json and initialize using DataModel
    var ayah =  surah.ayahs!.map((e) => e).toList();
    print(ayah[0]);

  }



  void changeButton(String x,int v){
    if(oldIndex==v)
    {
      isClicked=!isClicked;

    }else{
      iconsList[oldIndex]=Icons.play_circle_outline_outlined;
      if(isClicked==false)
      {
        isClicked=true;
      }
    }
    if(isClicked)
    {
      oldIndex=v;
      iconsList[v]=Icons.stop_circle_outlined;
      play(x);
      emit(ChangeIconState());

    }
    else
    {
      iconsList[v]=Icons.play_circle_outline_outlined;
      stopZekr();
      emit(ChangeIconState());

    }
  }
  int counter = 0;


  int roll = 0;
  int addRoll()
  {

    if(counter%33==0)
    {
      roll++;
    }
    return roll;
  }



  void addCount()
  {
    counter++;
    emit(ChangeCounterState());
  }

  void changeName1()
  {
    name = "ألله اكبر";
    roll=0;
    counter=0;
    emit(ChangeNameState());
  }

  void changeName2()
  {
    name = "   الحمد لله";
    roll=0;
    counter=0;
    emit(ChangeNameState());
  }

  void changeName3()
  {
    name = "سبحان الله";
    roll=0;
    counter=0;
    emit(ChangeNameState());
  }

  void changeName4()
  {
    name = "أستغفر الله";
    roll=0;
    counter=0;
    emit(ChangeNameState());
  }

  void changeName5()
  {
    name = "لا اله الا الله";
    roll=0;
    counter=0;
    emit(ChangeNameState());
  }

  void changeName6()
  {
    name = "لا حول ولا قوة الا بالله";
    roll=0;
    counter=0;
    emit(ChangeNameState());
  }

  void changeName7()
  {
    name = "سبحان الله وبحمده";
    roll=0;
    counter=0;
    emit(ChangeNameState());
  }

  void changeName8()
  {
    name = "سبحان الله وبحمده";
    roll=0;
    counter=0;
    emit(ChangeNameState());
  }

  void changeName9()
  {
    name = "اللهم صلى على سيدنا محمد";
    roll=0;
    counter=0;
    emit(ChangeNameState());
  }

  void reset()
  {
    counter=0;
    name = "ألله اكبر";
    roll=0;
    emit(ResetCounterState());
  }



}