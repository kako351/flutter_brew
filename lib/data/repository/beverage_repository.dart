import 'package:dio/dio.dart';
import 'package:flutter_brew/data/infra/api_service.dart';
import 'package:flutter_brew/data/infra/response/beverage_response.dart';
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_detail_result.dart' as beverage_detail_result;
import 'package:flutter_brew/data/model/beverage_result.dart' as beverage_result;
import 'package:flutter_brew/data/model/beverage_type.dart';

abstract interface class BeverageRepository {
  Future<beverage_result.BeverageResult> getAllBeverage();

  Future<beverage_result.BeverageResult> getHotBeverage();

  Future<beverage_detail_result.BeverageDetailResult> getHotBeverageDetail(int id);

  Future<beverage_result.BeverageResult> getIcedBeverage();

  Future<beverage_detail_result.BeverageDetailResult> getIcedBeverageDetail(int id);
}

class BeverageRepositoryImpl implements BeverageRepository {
  final ApiService client;

  BeverageRepositoryImpl({ApiService? apiClient})
      : client = apiClient ?? ApiService(Dio());

  @override
  Future<beverage_result.BeverageResult> getAllBeverage() async {
    try {
      Future<List<BeverageResponse>> hot() async => client.getHotBeverages();
      Future<List<BeverageResponse>> iced() async => client.getIcedBeverages();

      var result = await Future.wait([hot(), iced()]);
      List<Beverage> list = result.expand((element) => element).map((res) {
        if (result[0].contains(res)) {
          return Beverage.fromResponse(res, BeverageType.hot);
        } else {
          return Beverage.fromResponse(res, BeverageType.iced);
        }
      }).toList();

      return beverage_result.Success(list);
    } catch (e) {
      return beverage_result.Error(e.toString());
    }
  }

  @override
  Future<beverage_result.BeverageResult> getHotBeverage() async {
    try {
      List<BeverageResponse> result = await client.getHotBeverages();
      List<Beverage> list = result.map((res) => Beverage.fromResponse(res, BeverageType.hot)).toList();
      return beverage_result.Success(list);
    } catch (e) {
      return beverage_result.Error(e.toString());
    }
  }

  @override
  Future<beverage_detail_result.BeverageDetailResult> getHotBeverageDetail(int id) async {
    try {
      BeverageResponse result = await client.getHotBeverageDetail(id);
      Beverage beverage = Beverage.fromResponse(result, BeverageType.hot);
      return beverage_detail_result.Success(beverage);
    } catch (e) {
      return beverage_detail_result.Error(e.toString());
    }
  }

  @override
  Future<beverage_result.BeverageResult> getIcedBeverage() async {
    try {
      List<BeverageResponse> result = await client.getIcedBeverages();
      List<Beverage> list = result.map((res) => Beverage.fromResponse(res, BeverageType.iced)).toList();
      return beverage_result.Success(list);
    } catch (e) {
      return beverage_result.Error(e.toString());
    }
  }

  @override
  Future<beverage_detail_result.BeverageDetailResult> getIcedBeverageDetail(int id) async {
    try {
      BeverageResponse result = await client.getIcedBeverageDetail(id);
      Beverage beverage = Beverage.fromResponse(result, BeverageType.iced);
      return beverage_detail_result.Success(beverage);
    } catch (e) {
      return beverage_detail_result.Error(e.toString());
    }
  }
}
