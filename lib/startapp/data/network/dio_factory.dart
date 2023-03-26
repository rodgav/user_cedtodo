
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:user_cedtodo/startapp/application/constants.dart';

const String applicationJson = 'application/json';
const String contentType = 'content-type';
const String accept = 'accept';
const String authorization = 'authorization';
const String defaultLanguage = 'language';

class DioFactory {
  //final AppPreferences _appPreferences;

  DioFactory(/*this._appPreferences*/);

  Future<Dio> getDio() async {
    final dio = Dio();
    Duration timeOut = const Duration(milliseconds: 6000);
    //String language = _appPreferences.getAppLanguage();

    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      //defaultLanguage: language
    };

    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: timeOut,
        receiveTimeout: timeOut,
        headers: headers);
    if (!kReleaseMode) {
      dio.interceptors.add(LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true));
    }

    return dio;
  }
}
