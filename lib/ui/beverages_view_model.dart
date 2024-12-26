import 'package:flutter_brew/data/model/beverage_result.dart';
import 'package:flutter_brew/data/repository/beverage_repository.dart';
import 'package:flutter_brew/ui/viewstate/beverages_view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'beverages_view_model.g.dart';

@riverpod
class BeveragesViewModel extends _$BeveragesViewModel {
  BeveragesViewModel({BeverageRepository? repository})
    : _repository = repository ?? BeverageRepositoryImpl();

  final BeverageRepository _repository;

  @override
  Future<BeveragesViewState> build() async {
    return getBeverages();
  }

  Future<BeveragesViewState> getBeverages() async {
    BeverageResult result = await _repository.getHotBeverage();
    return _handleBeverageResult(result);
  }

  BeveragesViewState _handleBeverageResult(BeverageResult result) {
    switch(result) {
      case Success():
        return SuccessBeveragesViewState(result.beverages);
      case Error():
        return ErrorBeveragesViewState();
    }
  }
}