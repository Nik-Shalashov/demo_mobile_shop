import 'dart:io';
import 'package:dio/dio.dart';
import 'dio_extensions.dart';
import 'network_exceptions.dart';

class ErrorsInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err.copyWith(error: _map(err)));
  }

  NetworkException _map(DioException err) {
    final cause = err.error;
    if (cause is NetworkException) return cause;

    switch (err.type) {
      case DioExceptionType.connectionError:
        return const NoConnectionException();

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        return const TimeoutException();

      case DioExceptionType.cancel:
        return const UnknownApiException('Запрос отменён');

      case DioExceptionType.badResponse:
        final response = err.response;
        final code = response?.statusCode ?? 0;

        if (response != null && response.isUnauthorizedError) {
          return UnauthorizedClientApiException(httpCode: code);
        }
        if (response != null && response.isClientError) {
          return ClientApiException(httpCode: code);
        }
        if (response != null && response.isServerError) {
          return ServerApiException(httpCode: code);
        }
        return UnknownApiException('Неизвестный статус ответа: $code');

      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        if (err.error is SocketException) return const NoConnectionException();
        return UnknownApiException(err.message);
    }
  }
}
