
import 'package:flutter_brew/data/model/beverage_result.dart';
import 'package:flutter_brew/data/repository/beverage_repository.dart';
import 'package:flutter_brew/ui/viewstate/search_result_view_state.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_result_view_model.g.dart';

@riverpod
class SearchResultViewModel extends _$SearchResultViewModel {
  final BeverageRepository _repository = GetIt.I<BeverageRepository>();

  @override
  Future<SearchResultViewState> build(String words) async {
    return getSearchResult(words);
  }

  Future<SearchResultViewState> getSearchResult(String words) async {
    BeverageResult result = await _repository.findSearchWords(words);
    return _handleSearchResult(result);
  }

  SearchResultViewState _handleSearchResult(BeverageResult result) {
    switch(result) {
      case Success():
        return SuccessSearchResultViewState(result.beverages);
      case Error():
        return ErrorSearchResultViewState();
    }
  }
}
