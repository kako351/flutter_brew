import 'package:flutter_brew/data/infra/response/beverage_response.dart';
import 'package:flutter_brew/data/model/beverage_type.dart';
import 'package:flutter_brew/data/model/favorite_beverage.dart';
import 'package:flutter_brew/ui/herotag/hero_tag_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'beverage.freezed.dart';
part 'beverage.g.dart';

@Collection(ignore:{'copyWith'})
@freezed
class Beverage with _$Beverage {
  Beverage._();

  Id get id => Isar.autoIncrement;

  @override
  @enumerated
  BeverageType get type;

  final favorite = IsarLink<FavoriteBeverage>();

  factory Beverage({
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

  @Index()
  int get beverageIdIdx => beverageId;

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get descriptionWords => description.split(' ');

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get titleWords => title.split(' ');

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get ingredientsWords => ingredients.map((e) => e.split(' ')).expand((e) => e).toList();

  @Index()
  bool get isFavorite => favorite.value?.isFavorite ?? false;

  @ignore
  final imageHeroTag = HeroTagBuilder().build();

  @ignore
  final titleHeroTag = HeroTagBuilder().build();
}
