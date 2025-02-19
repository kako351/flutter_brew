import 'package:flutter_brew/data/model/beverage_result.dart';
import 'package:flutter_brew/data/model/beverage_type.dart';
import 'package:flutter_brew/data/model/search_history.dart';
import 'package:flutter_brew/data/repository/beverage_repository.dart';
import 'package:flutter_brew/data/repository/search_history_repository.dart';
import 'package:flutter_brew/ui/viewstate/beverages_view_state.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'beverages_view_model.g.dart';

@riverpod
class BeveragesViewModel extends _$BeveragesViewModel {

  final BeverageRepository _repository = GetIt.I<BeverageRepository>();
  final SearchHistoryRepository _searchHistoryRepository = GetIt.I<SearchHistoryRepository>();

  @override
  Future<BeveragesViewState> build() async {
    return getBeverages();
  }

  Future<BeveragesViewState> getBeverages() async {
    BeverageResult result = await _repository.getAllBeverage();
    return _handleBeverageResult(result, BeverageType.defaultValue);
  }

  BeveragesViewState _handleBeverageResult(BeverageResult result, BeverageType type, {List<SearchHistory> searchHistories = const []}) {
    switch(result) {
      case Success():
        return SuccessBeveragesViewState(result.beverages, type, searchHistories: searchHistories);
      case Error():
        return ErrorBeveragesViewState();
    }
  }

  Future<void> updateSelectedType(BeverageType type) async {
    var result = await _getBeveragesByType(type);
    state = state.whenData((viewState) {
      if (viewState is SuccessBeveragesViewState) {
        return _handleBeverageResult(result, type, searchHistories: viewState.searchHistories);
      }
      return viewState;
    });
  }

  Future<BeverageResult> _getBeveragesByType(BeverageType type) async {
    switch(type) {
      case BeverageType.hot:
        return await _repository.getHotBeverage();
      case BeverageType.iced:
        return await _repository.getIcedBeverage();
      case BeverageType.all:
        return await _repository.getAllBeverage();
    }
  }

  Future<void> updateSearchHistories(String words) async {
    final searchHistories = await _searchHistoryRepository.getSearchHistories(words);
    state = state.whenData((viewState) {
      if (viewState is SuccessBeveragesViewState) {
        return SuccessBeveragesViewState(viewState.beverages, viewState.type, searchHistories: searchHistories);
      }
      return viewState;
    });
  }

  Future<void> saveSearchHistory(String words) async {
    await _searchHistoryRepository.saveSearchHistory(words);
  }
}