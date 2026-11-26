import 'package:demo_mobile_shop/data/datasources/models/cart_product_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_cart_request_model.g.dart';

@JsonSerializable(createFactory: false, explicitToJson: true)
class CreateCartRequestModel {
  final int userId;
  final String date;
  final List<CartProductItemModel> products;

  const CreateCartRequestModel({
    required this.userId,
    required this.date,
    required this.products,
  });

  Map<String, dynamic> toJson() => _$CreateCartRequestModelToJson(this);
}