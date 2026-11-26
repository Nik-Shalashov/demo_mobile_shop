import 'package:demo_mobile_shop/data/datasources/local/product_local_datasource.dart';
import 'package:demo_mobile_shop/data/datasources/remote/product_remote_data_source.dart';
import 'package:demo_mobile_shop/data/repositories/product_repository_impl.dart';
import 'package:demo_mobile_shop/domain/repositories/product_repository.dart';
import 'package:demo_mobile_shop/domain/usecases/filter_products_usecase.dart';
import 'package:demo_mobile_shop/domain/usecases/get_categories_usecase.dart';
import 'package:demo_mobile_shop/domain/usecases/get_product_usecase.dart';
import 'package:demo_mobile_shop/domain/usecases/get_products_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';

void registerCatalogModule(GetIt getIt, Box<String> catalogBox) {

  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<ProductLocalDataSource>(
    () => ProductLocalDataSourceImpl(catalogBox),
  );

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remote: getIt(),
      local: getIt(),
    ),
  );

  getIt.registerLazySingleton<GetProductsUseCase>(
    () => GetProductsUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetProductUseCase>(
    () => GetProductUseCase(getIt()),
  );

  getIt.registerLazySingleton<GetCategoriesUseCase>(
    () => const GetCategoriesUseCase(),
  );
  getIt.registerLazySingleton<FilterProductsUseCase>(
    () => const FilterProductsUseCase(),
  );
}