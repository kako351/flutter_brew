
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

  Future<List<Beverage>> getIsFavoriteTrueBeverages() async {
    return await isar.beverages.filter()
        .favorite((q) {
          return q.isFavoriteEqualTo(true);
        })
        .findAll();
  }

  Future<Beverage?> getBeverage(int beverageId, BeverageType type) async {
    return await isar.beverages.filter().beverageIdEqualTo(beverageId).and().typeEqualTo(type).findFirst();
  }

  Future<Beverage?> updateFavorite(int beverageId, BeverageType type, bool isFavorite) async {
    return await isar.writeTxn(() async {
      final beverage = await isar.beverages.filter().beverageIdEqualTo(beverageId).and().typeEqualTo(type).findFirst();
      if(beverage == null) {
        return null;
      }
      final favorite = await isar.favoriteBeverages.filter().idEqualTo(beverage.id).findFirst();
      if(favorite == null) {
        return null;
      }
      final newFavorite = FavoriteBeverage(id: favorite.id, isFavorite: isFavorite);
      final newBeverage = Beverage(id: beverage.id, title: beverage.title, description: beverage.description, ingredients: beverage.ingredients, image: beverage.image, beverageId: beverage.beverageId, type: beverage.type)
        ..favorite.value = newFavorite;
      await isar.beverages.put(newBeverage);
      await isar.favoriteBeverages.put(newFavorite);
      await beverage.favorite.save();

      return newBeverage;
    });
  }
}
