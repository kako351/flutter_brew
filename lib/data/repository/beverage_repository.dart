import 'package:dio/dio.dart';
import 'package:flutter_brew/data/infra/api_service.dart';
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_detail_result.dart' as BeverageDetailResult;
import 'package:flutter_brew/data/model/beverage_result.dart' as BeverageResult;

abstract interface class BeverageRepository {
  Future<BeverageResult.BeverageResult> getBeverage();

  Future<BeverageDetailResult.BeverageDetailResult> getHotBeverageDetail(int id);
}

class BeverageRepositoryImpl implements BeverageRepository {
  final ApiService client;

  BeverageRepositoryImpl({ApiService? apiClient})
      : client = apiClient ?? ApiService(Dio());

  @override
  Future<BeverageResult.BeverageResult> getBeverage() async {
    try {
      List<Beverage> lists = await client.getBeverages();
      return BeverageResult.Success(lists);
    } catch (e) {
      return BeverageResult.Error(e.toString());
    }
  }

  @override
  Future<BeverageDetailResult.BeverageDetailResult> getHotBeverageDetail(int id) async {
    try {
      Beverage beverage = await client.getHotBeverageDetail(id);
      return BeverageDetailResult.Success(beverage);
    } catch (e) {
      return BeverageDetailResult.Error(e.toString());
    }
  }
}
