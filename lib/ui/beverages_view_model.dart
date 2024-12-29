import 'package:flutter_brew/data/model/beverage_result.dart';
import 'package:flutter_brew/data/model/beverage_type.dart';
import 'package:flutter_brew/data/repository/beverage_repository.dart';
import 'package:flutter_brew/ui/viewstate/beverages_view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'beverages_view_model.g.dart';

@riverpod
class BeveragesViewModel extends _$BeveragesViewModel {

  late final BeverageRepository _repository;

  @override
  Future<BeveragesViewState> build() async {
    _repository = await ref.read(beverageRepositoryImplProvider.future);
    return getBeverages();
  }

  Future<BeveragesViewState> getBeverages() async {
    BeverageResult result = await _repository.getAllBeverage();
    return _handleBeverageResult(result, BeverageType.defaultValue);
  }

  BeveragesViewState _handleBeverageResult(BeverageResult result, BeverageType type) {
    switch(result) {
      case Success():
        return SuccessBeveragesViewState(result.beverages, type);
      case Error():
        return ErrorBeveragesViewState();
    }
  }

  Future<void> updateSelectedType(BeverageType type) async {
    var result = await _getBeveragesByType(type);
    state = state.whenData((viewState) {
      if (viewState is SuccessBeveragesViewState) {
        return _handleBeverageResult(result, type);
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
}