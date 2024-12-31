
import 'package:flutter_brew/data/model/search_history.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

class LocalSearchHistory {
  final Isar isar = GetIt.I<Isar>();

  Future<List<SearchHistory>> getSearchHistories(String words) async {
    final query = switch(words.isEmpty) {
      true => isar.searchHistorys.where(),
      false => isar.searchHistorys.filter().queryWordsStartsWith(words).or().queryWordsEqualTo(words)
    };

    return await query.limit(5).findAll();
  }

  Future<void> saveSearchHistory(SearchHistory searchHistory) async {
    await isar.writeTxn(() async {
      await isar.searchHistorys.put(searchHistory);
    });
  }
}
