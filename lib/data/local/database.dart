
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/favorite_beverage.dart';
import 'package:flutter_brew/data/model/search_history.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isar(Ref ref) async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
  final dbPath = appDocumentDir.path;
  return openIsar(dbPath);
}

Future<Isar> openIsar(String dbPath, {String name = Isar.defaultName}) async {
  return Isar.open(
    [
      BeverageSchema,
      FavoriteBeverageSchema,
      SearchHistorySchema
    ],
    directory: dbPath,
    name: name,
  );
}
