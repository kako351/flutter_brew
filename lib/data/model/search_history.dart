
import 'package:isar/isar.dart';

part 'search_history.g.dart';

@collection
class SearchHistory {

  Id get id => Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String query;

  @Index(type: IndexType.value, caseSensitive: false)
  String get queryWords => query;
}
