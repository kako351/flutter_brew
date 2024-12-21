import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_detail_result.dart';
import 'package:flutter_brew/data/repository/beverage_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'beverage_detail_view_model.g.dart';

@riverpod
class BeverageDetailViewModel extends _$BeverageDetailViewModel {
  BeverageDetailViewModel({BeverageRepository? repository})
    : _repository = repository ?? BeverageRepositoryImpl();

  final BeverageRepository _repository;

  @override
  Future<Beverage> build(int id) async {
    return getBeverageDetail(id);
  }

  Future<Beverage> getBeverageDetail(int id) async {
    BeverageDetailResult result = await _repository.getHotBeverageDetail(id);
    try {
      return _handleBeverageDetailResult(result);
    } catch (e) {
      throw Future.error('Failed to get beverage detail');
    }
  }

  Beverage _handleBeverageDetailResult(BeverageDetailResult result) {
    switch(result) {
      case Success():
        return result.beverageDetail;
      case Error():
        throw Exception('Failed to get beverage detail');
    }
  }
}
