
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'search_history.freezed.dart';
part 'search_history.g.dart';

@Collection(ignore:{'copyWith'})
@freezed
class SearchHistory with _$SearchHistory {
  SearchHistory._();

  Id get id => Isar.autoIncrement;

  factory SearchHistory({
    required String query,
  }) = _SearchHistory;

  @Index(type: IndexType.value, caseSensitive: false)
  String get queryWords => query;
}
