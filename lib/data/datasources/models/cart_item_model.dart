import 'package:demo_mobile_shop/data/datasources/models/product_model.dart';
import 'package:demo_mobile_shop/domain/entities/cart_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item_model.g.dart';

@JsonSerializable()
class CartItemModel {
  final ProductModel product;
  final int quantity;

  const CartItemModel({
    required this.product,
    required this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);

  factory CartItemModel.fromEntity(CartItem item) => CartItemModel(
        product: ProductModel.fromEntity(item.product),
        quantity: item.quantity,
      );

  CartItem toEntity() => CartItem(
        product: product.toEntity(),
        quantity: quantity,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemModel &&
          runtimeType == other.runtimeType &&
          product == other.product &&
          quantity == other.quantity;

  @override
  int get hashCode => Object.hash(product, quantity);
}