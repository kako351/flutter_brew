import 'package:flutter_brew/data/infra/response/beverage_response.dart';
import 'package:flutter_brew/data/model/beverage_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beverage.freezed.dart';
part 'beverage.g.dart';

@freezed
class Beverage with _$Beverage {
  const Beverage._();

  const factory Beverage({
    required String title,
    required String description,
    required List<String> ingredients,
    required String image,
    required int beverageId,
    required BeverageType type,
  }) = _Beverage;

  factory Beverage.fromJson(Map<String, dynamic> json) => _$BeverageFromJson(json);

  factory Beverage.fromResponse(BeverageResponse response, BeverageType type) {
    return Beverage(
      title: response.title,
      description: response.description,
      ingredients: response.ingredients,
      image: response.image,
      beverageId: response.id,
      type: type,
    );
  }

  get imageHeroTag => 'beverage_image_${beverageId}_$title';
  get titleHeroTag => 'beverage_title_${beverageId}_$title';
}
