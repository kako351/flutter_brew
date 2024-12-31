
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'favorite_beverage.freezed.dart';
part 'favorite_beverage.g.dart';

@Collection(ignore:{'copyWith'})
@freezed
class FavoriteBeverage with _$FavoriteBeverage {
  FavoriteBeverage._();

  @override
  Id get id => super.id;

  factory FavoriteBeverage({
    @Default(Isar.autoIncrement) int id,
    required bool isFavorite,
  }) = _FavoriteBeverage;
}
