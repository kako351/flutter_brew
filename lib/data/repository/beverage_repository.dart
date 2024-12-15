import 'package:dio/dio.dart';
import 'package:flutter_brew/data/infra/api_service.dart';
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_result.dart';

abstract interface class BeverageRepository {
  Future<BeverageResult> getBeverage();
}

class BeverageRepositoryImpl implements BeverageRepository {
  final ApiService client;

  BeverageRepositoryImpl(this.client);

  BeverageRepositoryImpl.withOutClient()
      : client = ApiService(Dio());

  @override
  Future<BeverageResult> getBeverage() async {
    try {
      List<Beverage> lists = await client.getBeverages();
      return Success(lists);
    } catch (e) {
      return Error(e.toString());
    }
  }
}
