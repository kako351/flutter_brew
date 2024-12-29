
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_type.dart';
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
    await isar.writeTxn(() async {
      await isar.beverages.putAll(beverages);
    });
  }
}
