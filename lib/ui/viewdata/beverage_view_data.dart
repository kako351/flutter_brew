
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_type.dart';
import 'package:flutter_brew/ui/herotag/hero_tag_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beverage_view_data.freezed.dart';

@freezed
class BeverageViewData with _$BeverageViewData {
  const BeverageViewData._();

  const factory BeverageViewData({
    required int id,
    required String title,
    required String description,
    required List<String> ingredients,
    required String image,
    required int beverageId,
    required BeverageType type,
    required bool isFavorite,
    required HeroTag heroTag,
  }) = _BeverageViewData;

  factory BeverageViewData.fromBeverage(Beverage beverage, HeroTag heroTag) {
    return BeverageViewData(
      id: beverage.id,
      title: beverage.title,
      description: beverage.description,
      ingredients: beverage.ingredients,
      image: beverage.image,
      beverageId: beverage.beverageId,
      type: beverage.type,
      isFavorite: beverage.isFavorite,
      heroTag: heroTag,
    );
  }
}