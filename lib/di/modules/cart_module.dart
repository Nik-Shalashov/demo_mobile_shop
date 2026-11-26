import 'package:demo_mobile_shop/data/datasources/local/cart_local_datasource.dart';
import 'package:demo_mobile_shop/data/repositories/cart_repository_impl.dart';
import 'package:demo_mobile_shop/domain/repositories/cart_repository.dart';
import 'package:demo_mobile_shop/domain/usecases/add_to_cart_usecase.dart';
import 'package:demo_mobile_shop/domain/usecases/clear_cart_usecase.dart';
import 'package:demo_mobile_shop/domain/usecases/get_cart_usecase.dart';
import 'package:demo_mobile_shop/domain/usecases/remove_from_cart_usecase.dart';
import 'package:demo_mobile_shop/domain/usecases/update_cart_item_quantity_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';

void registerCartModule(GetIt getIt, Box<String> cartBox) {
  getIt.registerLazySingleton<CartLocalDataSource>(
    () => CartLocalDataSourceImpl(cartBox),
  );

  getIt.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton<GetCartUseCase>(
    () => GetCartUseCase(getIt()),
  );
  getIt.registerLazySingleton<AddToCartUseCase>(
    () => AddToCartUseCase(getIt()),
  );
  getIt.registerLazySingleton<RemoveFromCartUseCase>(
    () => RemoveFromCartUseCase(getIt()),
  );
  getIt.registerLazySingleton<UpdateCartItemQuantityUseCase>(
    () => UpdateCartItemQuantityUseCase(getIt()),
  );
  getIt.registerLazySingleton<ClearCartUseCase>(
    () => ClearCartUseCase(getIt()),
  );
}