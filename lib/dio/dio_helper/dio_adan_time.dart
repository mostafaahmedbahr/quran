
import 'package:dio/dio.dart';
// http://api.aladhan.com/v1/timingsByCity?city=Dubai&country=United%20Arab%20Emirates&method=8
 class DioAdanHelper
{
  static Dio? dio;

  static int() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://api.aladhan.com/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    String url="v1/timingsByCity?",
    Map<String,dynamic>? query,
  }) async
  {
    return await dio!.get(url,
      queryParameters: query,
    );
  }

}