
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_type.dart';
import 'package:flutter_brew/data/model/favorite_beverage.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';


class LocalBeverages {
  final Isar isar = GetIt.I<Isar>();

  Future<List<Beverage>> getBeverages() async {
    return await isar.beverages.where().findAll();
  }

  Future<List<Beverage>> getHotBeverages() async {
    return await isar.beverages.filter().typeEqualTo(BeverageType.hot).findAll();
  }

  Future<List<Beverage>> getIcedBeverages() async {
    return await isar.beverages.filter().typeEqualTo(BeverageType.iced).findAll();
  }

  Future<void> saveBeverages(List<Beverage> beverages) async {
    final favorite = FavoriteBeverage(isFavorite: false);
    await isar.writeTxnSync(() async {
      for (var element in beverages) {
        element.favorite.value = favorite;
      }

      isar.beverages.putAllSync(beverages);
    });
  }

  Future<List<Beverage>> findSearchWords(String words) async {
    return await isar.beverages.where()
        .titleWordsElementStartsWith(words)
        .or()
        .titleWordsElementEqualTo(words)
        .or()
        .descriptionWordsElementStartsWith(words)
        .or()
        .descriptionWordsElementEqualTo(words)
        .or()
        .ingredientsWordsElementStartsWith(words)
        .or()
        .ingredientsWordsElementEqualTo(words)
        .findAll();
  }
}
