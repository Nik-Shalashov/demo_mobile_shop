import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:demo_mobile_shop/log.dart';
import 'package:demo_mobile_shop/presentation/core/logging_bloc_observer.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class Enviroment {
  Enviroment._();

  static final bool isMobile = !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  static Log log = ConsolePrettyLog();

  static const String url = 'https://fakestoreapi.com/';

  static Future<void> init() async {
    Bloc.observer = LoggingBlocObserver(log);

    EquatableConfig.stringify = true;
  }

  static void recordFlutterError(FlutterErrorDetails flutterErrorDetails) {
    log.fatal(flutterErrorDetails.toString());
  }

  static bool recordError(dynamic exception, StackTrace stack) {
    log.fatal(exception.toString(), exception, stack);
    return true;
  }
}