import 'package:dio/dio.dart';
import 'package:flutter_brew/data/infra/api_service.dart';
import 'package:flutter_brew/data/infra/response/beverage_response.dart';
import 'package:flutter_brew/data/local/local_beverages.dart';
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_detail_result.dart' as beverage_detail_result;
import 'package:flutter_brew/data/model/beverage_result.dart' as beverage_result;
import 'package:flutter_brew/data/model/beverage_type.dart';
import 'package:get_it/get_it.dart';

abstract interface class BeverageRepository {
  Future<beverage_result.BeverageResult> getAllBeverage();

  Future<beverage_result.BeverageResult> getHotBeverage();

  Future<beverage_detail_result.BeverageDetailResult> getHotBeverageDetail(int id);

  Future<beverage_result.BeverageResult> getIcedBeverage();

  Future<beverage_detail_result.BeverageDetailResult> getIcedBeverageDetail(int id);

  Future<beverage_detail_result.BeverageDetailResult> getBeverageDetail(int id, BeverageType type);

  Future<beverage_result.BeverageResult> findSearchWords(String words);

  Future<beverage_result.BeverageResult> getIsFavoriteTrueBeverages();
}

class BeverageRepositoryImpl implements BeverageRepository {
  final ApiService client;
  final LocalBeverages localBeverages = GetIt.I<LocalBeverages>();

  BeverageRepositoryImpl({ApiService? apiClient})
      : client = apiClient ?? ApiService(Dio());


  @override
  Future<beverage_result.BeverageResult> getAllBeverage() async {
    try {
      final localBeverages = await this.localBeverages.getBeverages();

      if(localBeverages.isNotEmpty) {
        return beverage_result.Success(localBeverages);
      }

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

      await this.localBeverages.saveBeverages(list);

      return beverage_result.Success(list);
    } catch (e) {
      return beverage_result.Error(e.toString());
    }
  }

  @override
  Future<beverage_result.BeverageResult> getHotBeverage() async {
    try {
      final localBeverages = await this.localBeverages.getHotBeverages();

      if(localBeverages.isNotEmpty) {
        return beverage_result.Success(localBeverages);
      }

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
      final localBeverages = await this.localBeverages.getIcedBeverages();

      if(localBeverages.isNotEmpty) {
        return beverage_result.Success(localBeverages);
      }

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

  @override
  Future<beverage_detail_result.BeverageDetailResult> getBeverageDetail(int id, BeverageType type) async {
    try {
      BeverageResponse result = switch(type) {
        BeverageType.hot => await client.getHotBeverageDetail(id),
        BeverageType.iced => await client.getIcedBeverageDetail(id),
        _ => throw Exception('Invalid beverage type'),
      };
      Beverage beverage = Beverage.fromResponse(result, type);
      return beverage_detail_result.Success(beverage);
    } catch (e) {
      return beverage_detail_result.Error(e.toString());
    }
  }

  @override
  Future<beverage_result.BeverageResult> findSearchWords(String words) async {
    try {
      List<Beverage> result = await localBeverages.findSearchWords(words);
      return beverage_result.Success(result);
    } catch (e) {
      return beverage_result.Error(e.toString());
    }
  }

  @override
  Future<beverage_result.BeverageResult> getIsFavoriteTrueBeverages() async {
    try {
      List<Beverage> result = await localBeverages.getIsFavoriteTrueBeverages();
      return beverage_result.Success(result);
    } catch (e) {
      return beverage_result.Error(e.toString());
    }
  }
}
