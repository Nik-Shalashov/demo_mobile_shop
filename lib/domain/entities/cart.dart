import 'package:demo_mobile_shop/domain/entities/cart_item.dart';
import 'package:demo_mobile_shop/domain/entities/product.dart';

class Cart {
  final List<CartItem> items;

  const Cart({required this.items});

  static const empty = Cart(items: []);

  double get total {
    return items.fold(0.0, (sum, item) => sum + item.subtotal);
  }

  int get totalQuantity {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }

  int get distinctItemCount => items.length;

  bool get isEmpty => items.isEmpty;

  bool contains(int productId) {
    return items.any((item) => item.product.id == productId);
  }

  CartItem? itemFor(int productId) {
    for (final item in items) {
      if (item.product.id == productId) return item;
    }
    return null;
  }

  Cart withProductAdded(Product product, {int quantity = 1}) {
    if (quantity < 1) return this;

    final existingIndex = items.indexWhere((item) => item.product.id == product.id);
    if (existingIndex == -1) {
      return Cart(items: [...items, CartItem(product: product, quantity: quantity)]);
    }

    final existing = items[existingIndex];
    final updated = existing.copyWith(quantity: existing.quantity + quantity);
    final newItems = [...items];
    newItems[existingIndex] = updated;
    return Cart(items: newItems);
  }

  Cart withProductRemoved(int productId) {
    final newItems = items.where((item) => item.product.id != productId).toList();
    if (newItems.length == items.length) return this;
    return Cart(items: newItems);
  }

  Cart withProductQuantity(int productId, int quantity) {
    if (quantity <= 0) {
      return withProductRemoved(productId);
    }

    final index = items.indexWhere((item) => item.product.id == productId);
    if (index == -1) return this;

    final updated = items[index].copyWith(quantity: quantity);
    final newItems = [...items];
    newItems[index] = updated;
    return Cart(items: newItems);
  }

  Cart cleared() => Cart.empty;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cart &&
          runtimeType == other.runtimeType &&
          _itemsEqual(items, other.items);

  @override
  int get hashCode => Object.hashAll(items);

  bool _itemsEqual(List<CartItem> a, List<CartItem> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}