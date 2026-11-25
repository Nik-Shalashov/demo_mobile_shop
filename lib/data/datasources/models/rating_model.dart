import 'package:demo_mobile_shop/domain/entities/rating.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_model.g.dart';

@JsonSerializable()
class RatingModel {
  @JsonKey(fromJson: _rateFromJson)
  final double rate;

  final int count;

  const RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);

  Map<String, dynamic> toJson() => _$RatingModelToJson(this);

  Rating toEntity() => Rating(rate: rate, count: count);

  factory RatingModel.fromEntity(Rating rating) =>
      RatingModel(rate: rating.rate, count: rating.count);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RatingModel &&
          runtimeType == other.runtimeType &&
          rate == other.rate &&
          count == other.count;

  @override
  int get hashCode => rate.hashCode ^ count.hashCode;
}

double _rateFromJson(dynamic value) => (value as num).toDouble();