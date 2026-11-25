import 'package:bloc/bloc.dart';
import 'package:demo_mobile_shop/log.dart';

class LoggingBlocObserver implements BlocObserver {
  final Log log;

  LoggingBlocObserver(this.log);

  @override
  void onCreate(BlocBase bloc) {
    log.v('[${bloc.runtimeType}] created.');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log.v('[${bloc.runtimeType}] ${event.toString()}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log.v('[${bloc.runtimeType}] ${transition.toString()}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log.v('[${bloc.runtimeType}] ${change.toString()}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stacktrace) {
    log.e('[${bloc.runtimeType}]', error, stacktrace);
  }

  @override
  void onClose(BlocBase bloc) {
    log.v('[${bloc.runtimeType}] closed.');
  }

  @override
  void onDone(Bloc bloc, Object? event, [Object? error, StackTrace? stackTrace]) {
    log.v('[${bloc.runtimeType}] done.');
  }
}