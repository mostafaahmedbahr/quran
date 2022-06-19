import 'package:dio/dio.dart';

class DioFehres
{
  static  Dio? dio;
  static String baseUrl = "assets/fehres.json";
   static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
       ),
    );
    // initializeInterceptors();
  }

  static Future<Response> getData({
    String? url,

  }) async
  {
    dio?.options.headers=
    {
      "Content-Type":"husn_ar.json",
    };
    return await dio!.get(
      url!,
    );
  }




}