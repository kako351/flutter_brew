import 'package:dio/dio.dart';
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://api.sampleapis.com')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @GET('/coffee/hot')
  Future<List<Beverage>> getBeverages();

  @GET('/coffee/hot/{id}')
  Future<Beverage> getHotBeverageDetail(@Path('id') int id);
}
