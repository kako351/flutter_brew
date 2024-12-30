
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'favorite_beverage.g.dart';
part 'favorite_beverage.freezed.dart';

@Collection(ignore:{'copyWith'})
@freezed
class FavoriteBeverage with _$FavoriteBeverage {
  const FavoriteBeverage._();

  Id get id => Isar.autoIncrement;

  const factory FavoriteBeverage({
    required bool isFavorite,
  }) = _FavoriteBeverage;
}
