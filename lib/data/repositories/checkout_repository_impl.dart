import 'package:demo_mobile_shop/data/datasources/models/cart_product_item_model.dart';
import 'package:demo_mobile_shop/data/datasources/models/create_cart_request_model.dart';
import 'package:demo_mobile_shop/data/datasources/remote/checkout_remote_datasource.dart';
import 'package:demo_mobile_shop/domain/entities/cart_item.dart';
import 'package:demo_mobile_shop/domain/repositories/checkout_repository.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  static const int _fakeUserId = 1;

  final CheckoutRemoteDataSource _remote;

  CheckoutRepositoryImpl(this._remote);

  @override
  Future<void> submitOrder(List<CartItem> items) {
    final body = CreateCartRequestModel(
      userId: _fakeUserId,
      date: DateTime.now().toUtc().toIso8601String(),
      products: items
          .map((item) => CartProductItemModel(
                productId: item.product.id,
                quantity: item.quantity,
              ))
          .toList(),
    );
    return _remote.submitOrder(body);
  }
}