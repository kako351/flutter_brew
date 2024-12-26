import 'package:dio/dio.dart';
import 'package:flutter_brew/data/infra/response/beverage_response.dart';
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://api.sampleapis.com')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @GET('/coffee/hot')
  Future<List<BeverageResponse>> getHotBeverages();

  @GET('/coffee/hot/{id}')
  Future<BeverageResponse> getHotBeverageDetail(@Path('id') int id);

  @GET('/coffee/iced')
  Future<List<BeverageResponse>> getIcedBeverages();

  @GET('/coffee/iced/{id}')
  Future<BeverageResponse> getIcedBeverageDetail(@Path('id') int id);
}
