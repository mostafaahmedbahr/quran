
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/dio/dio_helper/dio_adan_time.dart';
import 'package:quran_app/models/adan_model.dart';
import 'states.dart';

class AdanTimeCubit extends Cubit<AdanTimeState>{
  AdanTimeCubit() : super(AdanInitialTimeState());
  static AdanTimeCubit get(context) => BlocProvider.of(context);







  AdanModel? adanModel;

  Future getAdanTimeData({
  required String city,
    required String country,
    required int method,
}) async
  {
    emit(AdanLoadingTimeState());
    DioAdanHelper.getData(

      query:
      {
        "city":city,
        "country":country,
        "method": method,
      },
    ).then((value)
    {
      adanModel = AdanModel.fromJson(value.data);
      print("nnnnnnnnnnnnnnnnn ${value.data}");
      print("asr asr asr asr ${adanModel!.data.timings.asr}");
      emit(AdanSuccessTimeState(adanModel!));
    }).catchError((error)
    {
      print("error in get adan time ${error.toString()}");
      emit(AdanErrorTimeState());
    });
  }


}