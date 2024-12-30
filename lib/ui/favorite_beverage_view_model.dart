
import 'package:flutter_brew/data/model/beverage_result.dart';
import 'package:flutter_brew/data/repository/beverage_repository.dart';
import 'package:flutter_brew/ui/viewstate/favorite_beverage_view_state.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_beverage_view_model.g.dart';

@riverpod
class FavoriteBeverageViewModel extends _$FavoriteBeverageViewModel {
  final BeverageRepository _repository = GetIt.I<BeverageRepository>();

  @override
  Future<FavoriteBeverageViewState> build() async {
    return getFavoriteBeverage();
  }

  Future<FavoriteBeverageViewState> getFavoriteBeverage() async {
    BeverageResult result = await _repository.getIsFavoriteTrueBeverages();
    return _handleFavoriteBeverage(result);
  }

  FavoriteBeverageViewState _handleFavoriteBeverage(BeverageResult result) {
    switch(result) {
      case Success():
        return SuccessFavoriteBeverageViewState(result.beverages);
      case Error():
        return ErrorFavoriteBeverageViewState();
    }
  }
}