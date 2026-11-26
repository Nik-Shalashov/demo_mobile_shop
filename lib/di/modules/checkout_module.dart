import 'package:demo_mobile_shop/data/core/order_number_generator_impl.dart';
import 'package:demo_mobile_shop/data/datasources/remote/checkout_remote_datasource.dart';
import 'package:demo_mobile_shop/data/repositories/checkout_repository_impl.dart';
import 'package:demo_mobile_shop/domain/repositories/checkout_repository.dart';
import 'package:demo_mobile_shop/domain/services/order_number_generator.dart';
import 'package:demo_mobile_shop/domain/usecases/place_order_usecase.dart';
import 'package:get_it/get_it.dart';

void registerCheckoutModule(GetIt getIt) {
  getIt.registerLazySingleton<CheckoutRemoteDataSource>(
    () => CheckoutRemoteDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<CheckoutRepository>(
    () => CheckoutRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton<OrderNumberGenerator>(
    OrderNumberGeneratorImpl.new,
  );

  getIt.registerLazySingleton<PlaceOrderUseCase>(
    () => PlaceOrderUseCase(
      checkoutRepository: getIt(),
      cartRepository: getIt(),
      orderNumberGenerator: getIt(),
    ),
  );
}