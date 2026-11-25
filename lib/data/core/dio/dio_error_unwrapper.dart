import 'package:demo_mobile_shop/data/core/dio/network_exceptions.dart';
import 'package:dio/dio.dart';

mixin DioUnwrapper {
   Never unwrapDioException(DioException error, StackTrace stackTrace) {
    final cause = error.error;
    final result = cause is NetworkException
        ? cause
        : UnknownApiException(error.message);

    Error.throwWithStackTrace(result, stackTrace);
  }
}