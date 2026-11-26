import 'dart:convert';

import 'package:demo_mobile_shop/data/datasources/models/product_model.dart';
import 'package:hive_ce/hive.dart';

abstract class ProductLocalDataSource {
  Future<void> cacheProducts(List<ProductModel> products);
  Future<List<ProductModel>?> getCachedProducts();
  Future<ProductModel?> getCachedProduct(int id);
  Future<void> clear();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  static const _productsKey = 'products';

  final Box<String> _box;

  ProductLocalDataSourceImpl(this._box);

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    final json = jsonEncode(products.map((p) => p.toJson()).toList());
    await _box.put(_productsKey, json);
  }

  @override
  Future<List<ProductModel>?> getCachedProducts() async {
    final raw = _box.get(_productsKey);
    if (raw == null) return null;

    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return list
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return null;
    }
  }

  @override
  Future<ProductModel?> getCachedProduct(int id) async {
    final cached = await getCachedProducts();
    if (cached == null) return null;
    for (final product in cached) {
      if (product.id == id) return product;
    }
    return null;
  }

  @override
  Future<void> clear() async {
    await _box.delete(_productsKey);
  }
}