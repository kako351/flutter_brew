import 'package:dio/dio.dart';
import 'package:flutter_brew/data/infra/api_service.dart';
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_detail_result.dart' as beverage_detail_result;
import 'package:flutter_brew/data/model/beverage_result.dart' as beverage_result;

abstract interface class BeverageRepository {
  Future<beverage_result.BeverageResult> getBeverage();

  Future<beverage_detail_result.BeverageDetailResult> getHotBeverageDetail(int id);
}

class BeverageRepositoryImpl implements BeverageRepository {
  final ApiService client;

  BeverageRepositoryImpl({ApiService? apiClient})
      : client = apiClient ?? ApiService(Dio());

  @override
  Future<beverage_result.BeverageResult> getBeverage() async {
    try {
      List<Beverage> lists = await client.getBeverages();
      return beverage_result.Success(lists);
    } catch (e) {
      return beverage_result.Error(e.toString());
    }
  }

  @override
  Future<beverage_detail_result.BeverageDetailResult> getHotBeverageDetail(int id) async {
    try {
      Beverage beverage = await client.getHotBeverageDetail(id);
      return beverage_detail_result.Success(beverage);
    } catch (e) {
      return beverage_detail_result.Error(e.toString());
    }
  }
}
