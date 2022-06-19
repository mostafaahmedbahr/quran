

import 'package:quran_app/core/components/constatnts.dart';

class DataDetailModel {
  List<DetailData>? detailData;

  DataDetailModel({this.detailData});

  DataDetailModel.fromJson(Map<String, dynamic> json) {
    if (json[title] != null) {
      detailData = <DetailData>[];
      json[title].forEach((v) {
        detailData!.add( DetailData.fromJson(v));
      });
    }
  }


}

class DetailData {
  int? id;
  int? repeat;
  String? arabicText;
  String? audioUrl;



  DetailData.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    arabicText = json['ARABIC_TEXT'];
    audioUrl = json['AUDIO'];
    repeat = json['REPEAT'];
  }

}