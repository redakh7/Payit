import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'http://54.176.183.194:8080/hps-login/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postDataLogins({
    required url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    return dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }


  static Future<Response> postData({
    required url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {

    return dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }

}
