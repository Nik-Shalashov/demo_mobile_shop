import 'package:json_annotation/json_annotation.dart';

part 'cart_product_item_model.g.dart';

@JsonSerializable(createFactory: false)
class CartProductItemModel {
  final int productId;
  final int quantity;

  const CartProductItemModel({
    required this.productId,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => _$CartProductItemModelToJson(this);
}