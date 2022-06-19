import 'package:dio/dio.dart';

class DioDataHelper
{
  static Dio? dio;
  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://www.hisnmuslim.com/api/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    String? url,
    Map<String ,dynamic>? query,
    String lang = "ar",
    String? token,
  }) async
  {
    dio?.options.headers=
    {
      "Content-Type":"husn_ar.json",
      "lang":lang,

    };
    return await dio!.get(
      url!,
      queryParameters: query,
    );
  }





}