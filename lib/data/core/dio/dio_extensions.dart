import 'package:dio/dio.dart';

extension ResponseErrors on Response {
  int get _code => statusCode ?? 0;

  bool get isClientError => _code >= 400 && _code < 500;
  bool get isServerError => _code >= 500 && _code < 600;
  bool get isUnauthorizedError => _code == 401;
}