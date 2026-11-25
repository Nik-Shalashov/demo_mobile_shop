import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:demo_mobile_shop/data/core/dio/error_interceptor.dart';
import 'package:demo_mobile_shop/environment.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioFactory {
  static final BaseOptions _defaultOptions = BaseOptions(
    baseUrl: Enviroment.url,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10),
  );

  static Dio buildMainClient() {
    final dio = Dio(_defaultOptions);

    if (kDebugMode) {
      dio.interceptors.add(
        AwesomeDioInterceptor(logResponseHeaders: false, logger: debugPrint),
      );
    }

    dio.interceptors.add(ErrorsInterceptor());

    return dio;
  }
}
