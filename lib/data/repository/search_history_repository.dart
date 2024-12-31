import 'package:flutter_brew/data/local/local_search_history.dart';
import 'package:flutter_brew/data/model/search_history.dart';
import 'package:get_it/get_it.dart';

abstract interface class SearchHistoryRepository {
  Future<List<SearchHistory>> getSearchHistories(String words);

  Future<void> saveSearchHistory(String words);
}

class SearchHistoryRepositoryImpl implements SearchHistoryRepository {
  final LocalSearchHistory localSearchHistory = GetIt.I<LocalSearchHistory>();

  SearchHistoryRepositoryImpl();

  @override
  Future<List<SearchHistory>> getSearchHistories(String words) async {
    return await localSearchHistory.getSearchHistories(words);
  }

  @override
  Future<void> saveSearchHistory(String words) async {
    await localSearchHistory.saveSearchHistory(SearchHistory(query: words));
  }
}
