sealed class NetworkException implements Exception {
  final String message;

  const NetworkException(this.message);

  @override
  String toString() => message;
}

class NoConnectionException extends NetworkException {
  const NoConnectionException() : super('Нет соединения с интернетом');
}

class TimeoutException extends NetworkException {
  const TimeoutException() : super('Сервер не отвечает. Попробуйте ещё раз');
}

class ClientApiException extends NetworkException {
  final int httpCode;

  const ClientApiException({required this.httpCode, String? message})
    : super(message ?? 'Ошибка запроса (код: $httpCode)');
}

class UnauthorizedClientApiException extends ClientApiException {
  const UnauthorizedClientApiException({
    required super.httpCode,
    super.message,
  });
}

class ServerApiException extends NetworkException {
  final int httpCode;

  const ServerApiException({required this.httpCode, String? message})
    : super(message ?? 'Ошибка сервера (код: $httpCode)');
}

class UnknownApiException extends NetworkException {
  const UnknownApiException([String? message])
    : super(message ?? 'Неизвестная ошибка сети');
}

class EmptyResponseException extends NetworkException {
  const EmptyResponseException() : super('Сервер вернул пустой ответ');
}
