import 'package:dio/dio.dart';
import 'package:flutter_brew/data/infra/api_service.dart';
import 'package:flutter_brew/data/model/beverage.dart';

abstract interface class BeverageRepository {
  Future<List<Beverage>> getBeverage();
}

class BeverageRepositoryImpl implements BeverageRepository {
  final ApiService client;

  BeverageRepositoryImpl(this.client);

  BeverageRepositoryImpl.withOutClient()
      : client = ApiService(Dio());

  @override
  Future<List<Beverage>> getBeverage() async {
    try {
      return await client.getBeverages();
    } catch (e) {
      rethrow;
    }
  }
}
