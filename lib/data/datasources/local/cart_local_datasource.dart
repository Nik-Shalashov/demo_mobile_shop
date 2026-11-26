import 'dart:convert';

import 'package:demo_mobile_shop/data/datasources/models/cart_item_model.dart';
import 'package:demo_mobile_shop/domain/entities/cart.dart';
import 'package:hive_ce/hive.dart';

abstract class CartLocalDataSource {
  Future<Cart> getCart();

  Future<void> saveCart(Cart cart);
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  static const _cartKey = 'cart';

  final Box<String> _box;

  CartLocalDataSourceImpl(this._box);

  @override
  Future<Cart> getCart() async {
    final raw = _box.get(_cartKey);
    if (raw == null) return Cart.empty;

    try {
      final list = jsonDecode(raw) as List<dynamic>;
      final items = list
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .map((m) => m.toEntity())
          .toList();
      if (items.isEmpty) return Cart.empty;
      return Cart(items: items);
    } catch (_) {
      return Cart.empty;
    }
  }

  @override
  Future<void> saveCart(Cart cart) async {
    final json = jsonEncode(
      cart.items.map((item) => CartItemModel.fromEntity(item).toJson()).toList(),
    );
    await _box.put(_cartKey, json);
  }
}