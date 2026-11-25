import 'package:logger/logger.dart';

class Log {
  void v(String message, [Object? error, StackTrace? stackTrace]) {}

  void d(String message, [Object? error, StackTrace? stackTrace]) {}

  void i(String message, [Object? error, StackTrace? stackTrace]) {}

  void w(String message, [Object? error, StackTrace? stackTrace]) {}

  void e(String message, [Object? error, StackTrace? stackTrace]) {}

  void fatal(String message, [Object? error, StackTrace? stackTrace]) {}
}

class ConsolePrettyLog implements Log {
  final logger = Logger(
    filter: ProductionFilter(),
    printer: PrettyPrinter(
      methodCount: 0,
      lineLength: 120,
    ),
  );

  @override
  void d(message, [error, StackTrace? stackTrace]) {
    logger.d(message, error: error, stackTrace: stackTrace);
  }

  @override
  void e(message, [error, StackTrace? stackTrace]) {
    logger.e(message, error: error, stackTrace: stackTrace);
  }

  @override
  void i(message, [error, StackTrace? stackTrace]) {
    logger.i(message, error: error, stackTrace: stackTrace);
  }

  @override
  void v(message, [error, StackTrace? stackTrace]) {
    logger.t(message, error: error, stackTrace: stackTrace);
  }

  @override
  void w(message, [error, StackTrace? stackTrace]) {
    logger.w(message, error: error, stackTrace: stackTrace);
  }

  @override
  void fatal(message, [error, StackTrace? stackTrace]) {
    logger.f(message, error: error, stackTrace: stackTrace);
  }
}