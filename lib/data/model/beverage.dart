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
    required int id,
  }) = _Beverage;

  factory Beverage.fromJson(Map<String, dynamic> json) => _$BeverageFromJson(json);

  get imageHeroTag => 'beverage_image_${id}_$title';
  get titleHeroTag => 'beverage_title_${id}_$title';
}
