import 'package:quran_app/models/adan_model.dart';

abstract class AdanTimeState{}

class AdanInitialTimeState extends AdanTimeState{}

class AdanLoadingTimeState extends AdanTimeState{}

class AdanSuccessTimeState extends AdanTimeState{
  final AdanModel adanModel;
  AdanSuccessTimeState(this.adanModel);
}

class AdanErrorTimeState extends AdanTimeState{}



