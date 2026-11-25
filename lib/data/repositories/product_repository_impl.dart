import 'package:demo_mobile_shop/data/core/dio/network_exceptions.dart';
import 'package:demo_mobile_shop/data/datasources/local/product_local_datasource.dart';
import 'package:demo_mobile_shop/data/datasources/models/product_model.dart';
import 'package:demo_mobile_shop/data/datasources/remote/product_remote_data_source.dart';
import 'package:demo_mobile_shop/domain/entities/catalog_result.dart';
import 'package:demo_mobile_shop/domain/entities/product.dart';
import 'package:demo_mobile_shop/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _remote;
  final ProductLocalDataSource _local;

  ProductRepositoryImpl({
    required this._remote,
    required this._local,
  });

  @override
  Future<CatalogResult> getProducts() async {
    try {
      final models = await _remote.getProducts();

      if (models.isEmpty) {
        throw const EmptyResponseException();
      }

      await _local.cacheProducts(models);

      return CatalogResult.network(
        models.map((m) => m.toEntity()).toList(),
      );
    } on NoConnectionException catch (e, st) {
      return _productsFromCacheOrThrow(e, st);
    } on TimeoutException catch (e, st) {
      return _productsFromCacheOrThrow(e, st);
    }
  }

  @override
  Future<Product> getProduct(int id) async {
    try {
      final model = await _remote.getProduct(id);
      await _updateCacheWithProduct(model);
      return model.toEntity();
    } on NoConnectionException catch (e, st) {
      return _productFromCacheOrThrow(id, e, st);
    } on TimeoutException catch (e, st) {
      return _productFromCacheOrThrow(id, e, st);
    }
  }

  Future<CatalogResult> _productsFromCacheOrThrow(
    NetworkException error,
    StackTrace stackTrace,
  ) async {
    final cached = await _local.getCachedProducts();
    if (cached != null && cached.isNotEmpty) {
      return CatalogResult.cache(
        cached.map((m) => m.toEntity()).toList(),
      );
    }
    Error.throwWithStackTrace(error, stackTrace);
  }

  Future<Product> _productFromCacheOrThrow(
    int id,
    NetworkException error,
    StackTrace stackTrace,
  ) async {
    final cached = await _local.getCachedProduct(id);
    if (cached != null) return cached.toEntity();
    Error.throwWithStackTrace(error, stackTrace);
  }

  Future<void> _updateCacheWithProduct(ProductModel product) async {
    final cached = await _local.getCachedProducts() ?? const <ProductModel>[];
    final updated = [
      for (final p in cached)
        if (p.id != product.id) p,
      product,
    ];
    await _local.cacheProducts(updated);
  }
}
