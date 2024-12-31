import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_detail_result.dart';
import 'package:flutter_brew/data/model/beverage_type.dart';
import 'package:flutter_brew/data/repository/beverage_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'beverage_detail_view_model.g.dart';

@riverpod
class BeverageDetailViewModel extends _$BeverageDetailViewModel {
  final BeverageRepository _repository = GetIt.I<BeverageRepository>();

  @override
  Future<Beverage> build(int id, BeverageType type) async {
    return getBeverageDetail(id, type);
  }

  Future<Beverage> getBeverageDetail(int id, BeverageType type) async {
    BeverageDetailResult result = await _repository.getBeverageDetail(id, type);
    try {
      return _handleBeverageDetailResult(result);
    } catch (e) {
      throw Exception('Failed to get beverage detail');
    }
  }

  Beverage _handleBeverageDetailResult(BeverageDetailResult result) {
    switch(result) {
      case Success():
        return result.beverageDetail;
      case Error():
        throw Exception(result.message);
    }
  }

  Future<void> updateFavorite(int beverageId, BeverageType type, bool isFavorite) async {
    BeverageDetailResult result = await _repository.updateFavorite(id, type, isFavorite);
    state = state.whenData((viewState) {
      return _handleBeverageDetailResult(result);
    });
  }
}
