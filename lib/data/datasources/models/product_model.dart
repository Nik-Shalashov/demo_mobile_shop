import 'package:demo_mobile_shop/domain/entities/product.dart';
import 'package:json_annotation/json_annotation.dart';
import 'rating_model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int id;

  final String title;

  @JsonKey(fromJson: _priceFromJson)
  final double price;

  final String description;

  final String category;

  final String image;

  final RatingModel rating;

  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  Product toEntity() => Product(
        id: id,
        title: title,
        price: price,
        description: description,
        category: category,
        image: image,
        rating: rating.toEntity(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          price == other.price &&
          description == other.description &&
          category == other.category &&
          image == other.image &&
          rating == other.rating;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      price.hashCode ^
      description.hashCode ^
      category.hashCode ^
      image.hashCode ^
      rating.hashCode;
}

double _priceFromJson(dynamic value) => (value as num).toDouble();