import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_result.dart';
import 'package:flutter_brew/data/model/beverage_type.dart';
import 'package:flutter_brew/data/repository/beverage_repository.dart';
import 'package:flutter_brew/ui/viewstate/beverages_view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'beverages_view_model.g.dart';

@riverpod
class BeveragesViewModel extends _$BeveragesViewModel {
  BeveragesViewModel({BeverageRepository? repository})
    : _repository = repository ?? BeverageRepositoryImpl();

  final BeverageRepository _repository;

  List<Beverage> _beverages = <Beverage>[];

  @override
  Future<BeveragesViewState> build() async {
    return getBeverages();
  }

  Future<BeveragesViewState> getBeverages() async {
    BeverageResult result = await _repository.getAllBeverage();
    return _handleBeverageResult(result);
  }

  BeveragesViewState _handleBeverageResult(BeverageResult result) {
    switch(result) {
      case Success():
        _beverages = result.beverages;
        return SuccessBeveragesViewState(result.beverages, BeverageType.defaultValue);
      case Error():
        return ErrorBeveragesViewState();
    }
  }

  void updateSelectedType(BeverageType type) {
    state = state.whenData((viewState) {
      if (viewState is SuccessBeveragesViewState) {
        return SuccessBeveragesViewState(_getBeveragesByType(type), type);
      }
      return viewState;
    });
  }

  List<Beverage> _getBeveragesByType(BeverageType type) {
    switch(type) {
      case BeverageType.all:
        return _beverages;
      default:
        return _beverages.where((beverage) => beverage.type == type).toList();
    }
  }
}