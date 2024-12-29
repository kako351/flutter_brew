
import 'package:flutter_brew/data/local/database.dart';
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_beverages.g.dart';

@Riverpod(keepAlive: true)
Future<LocalBeverages> localBeverages(Ref ref) async {
  final isar = await ref.watch(isarProvider.future);
  return LocalBeverages(isar);
}

class LocalBeverages {
  LocalBeverages(this.isar);

  final Isar isar;

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
