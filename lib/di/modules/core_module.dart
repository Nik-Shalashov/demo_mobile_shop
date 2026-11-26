import 'package:demo_mobile_shop/data/core/dio/dio_factory.dart';
import 'package:demo_mobile_shop/data/core/network_status_service_impl.dart';
import 'package:demo_mobile_shop/domain/services/network_status_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

void registerCoreModule(GetIt getIt) {
  getIt.registerLazySingleton<Dio>(DioFactory.buildMainClient);

  getIt.registerLazySingleton<NetworkStatusService>(
    NetworkStatusServiceImpl.new,
  );
}