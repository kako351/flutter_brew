import 'package:flutter_brew/data/infra/api_service.dart';
import 'package:flutter_brew/data/infra/response/beverage_response.dart';
import 'package:flutter_brew/data/local/local_beverages.dart';
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_detail_result.dart' as beverage_detail_result;
import 'package:flutter_brew/data/model/beverage_result.dart';
import 'package:flutter_brew/data/model/beverage_type.dart';
import 'package:flutter_brew/data/repository/beverage_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ApiService>(), MockSpec<LocalBeverages>()])
import 'beverage_repository_test.mocks.dart';

void main() {
  final List<BeverageResponse> mockBeverages = [
    BeverageResponse(
      id: 1,
      title: 'Black Coffee',
      description: 'Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt. Och om du vill låta fancy kan du kalla svart kaffe med sitt rätta namn: café noir.',
      ingredients: ['Coffee'],
      image: 'https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    ),
    BeverageResponse(
      id: 2,
      title: 'Latte',
      description: 'Latte är en kaffe dryck gjord på espresso och varm ångad mjölk. Det är en italiensk ord som betyder mjölk.',
      ingredients: ['Espresso', 'Milk'],
      image: 'https://images.unsplash.com/photo-1551024501-4b3f6c0f5c6a?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    ),
  ];

  final List<BeverageResponse> mockIcedBeverages = [
    BeverageResponse(
      id: 1,
      title: 'Iced Black Coffee',
      description: 'Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat kallt. Och om du vill låta fancy kan du kalla svart kaffe med sitt rätta namn: café noir.',
      ingredients: ['Coffee'],
      image: 'https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    ),
    BeverageResponse(
      id: 2,
      title: 'Iced Latte',
      description: 'Latte är en kaffe dryck gjord på espresso och kall mjölk. Det är en italiensk ord som betyder mjölk.',
      ingredients: ['Espresso', 'Milk'],
      image: 'https://images.unsplash.com/photo-1551024501-4b3f6c0f5c6a?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    ),
  ];

  final mockApiService = MockApiService();
  final mockLocalBeverages = MockLocalBeverages();
  late final BeverageRepository beverageRepository;
  final getIt = GetIt.instance;

  setUpAll((){
    getIt.registerSingleton<LocalBeverages>(mockLocalBeverages);
    beverageRepository = BeverageRepositoryImpl(apiClient: mockApiService);
  });

  tearDownAll((){
    addTearDown(getIt.reset);
  });

  test('beverage repository success test', () async {
    // arrange
    when(mockApiService.getHotBeverages()).thenAnswer((_) async => mockBeverages);
    final expectedBeverages = mockBeverages.map((e) => Beverage.fromResponse(e, BeverageType.hot)).toList();

    // act
    final result = await beverageRepository.getHotBeverage();

    // assert
    expect(result, isA<Success>());
    expect((result as Success).beverages, expectedBeverages);
  });


  test('beverage repository error test', () async {
    // arrange
    when(mockApiService.getHotBeverages()).thenThrow(Exception('error'));

    // act
    final result = await beverageRepository.getHotBeverage();

    // assert
    expect(result, isA<Error>());
    expect((result as Error).message, Exception('error').toString());
  });

  test('beverage repository hot beverage detail success test', () async {
    // arrange
    when(mockApiService.getHotBeverageDetail(1)).thenAnswer((_) async => mockBeverages[0]);
    final expectedBeverage = Beverage.fromResponse(mockBeverages[0], BeverageType.hot);

    // act
    final result = await beverageRepository.getHotBeverageDetail(1);

    // assert
    expect(result, isA<beverage_detail_result.Success>());
    expect((result as beverage_detail_result.Success).beverageDetail, expectedBeverage);
  });

  test('beverage repository hot beverage detail error test', () async {
    // arrange
    when(mockApiService.getHotBeverageDetail(1)).thenThrow(Exception('error'));

    // act
    final result = await beverageRepository.getHotBeverageDetail(1);

    // assert
    expect(result, isA<beverage_detail_result.Error>());
    expect((result as beverage_detail_result.Error).message, Exception('error').toString());
  });

  test('beverage repository iced beverage success test', () async {
    // arrange
    when(mockApiService.getIcedBeverages()).thenAnswer((_) async => mockBeverages);
    final expectedBeverages = mockBeverages.map((e) => Beverage.fromResponse(e, BeverageType.iced)).toList();

    // act
    final result = await beverageRepository.getIcedBeverage();

    // assert
    expect(result, isA<Success>());
    expect((result as Success).beverages, expectedBeverages);
  });

  test('beverage repository iced beverage error test', () async {
    // arrange
    when(mockApiService.getIcedBeverages()).thenThrow(Exception('error'));

    // act
    final result = await beverageRepository.getIcedBeverage();

    // assert
    expect(result, isA<Error>());
    expect((result as Error).message, Exception('error').toString());
  });

  test('beverage repository iced beverage detail success test', () async {
    // arrange
    when(mockApiService.getIcedBeverageDetail(1)).thenAnswer((_) async => mockBeverages[0]);
    final expectedBeverage = Beverage.fromResponse(mockBeverages[0], BeverageType.iced);

    // act
    final result = await beverageRepository.getIcedBeverageDetail(1);

    // assert
    expect(result, isA<beverage_detail_result.Success>());
    expect((result as beverage_detail_result.Success).beverageDetail, expectedBeverage);
  });

  test('beverage repository iced beverage detail error test', () async {
    // arrange
    when(mockApiService.getIcedBeverageDetail(1)).thenThrow(Exception('error'));

    // act
    final result = await beverageRepository.getIcedBeverageDetail(1);

    // assert
    expect(result, isA<beverage_detail_result.Error>());
    expect((result as beverage_detail_result.Error).message, Exception('error').toString());
  });

  test('beverage repository all beverages success test', () async {
    // arrange
    when(mockApiService.getHotBeverages()).thenAnswer((_) async => mockBeverages);
    when(mockApiService.getIcedBeverages()).thenAnswer((_) async => mockIcedBeverages);
    final expectedBeverages = mockBeverages.map((e) => Beverage.fromResponse(e, BeverageType.hot)).toList();
    expectedBeverages.addAll(mockIcedBeverages.map((e) => Beverage.fromResponse(e, BeverageType.iced)).toList());

    // act
    final result = await beverageRepository.getAllBeverage();

    // assert
    expect(result, isA<Success>());
    expect((result as Success).beverages, expectedBeverages);
  });

  test('beverage repository all beverages error test', () async {
    // arrange
    when(mockApiService.getHotBeverages()).thenThrow(Exception('error'));

    // act
    final result = await beverageRepository.getAllBeverage();

    // assert
    expect(result, isA<Error>());
    expect((result as Error).message, Exception('error').toString());
  });

  test('beverage repository detail beverages success hot test', () async {
    // arrange
    when(mockApiService.getHotBeverageDetail(1)).thenAnswer((_) async => mockBeverages[0]);
    final expectedBeverage = Beverage.fromResponse(mockBeverages[0], BeverageType.hot);

    // act
    final result = await beverageRepository.getBeverageDetail(1, BeverageType.hot);

    // assert
    expect(result, isA<beverage_detail_result.Success>());
    expect((result as beverage_detail_result.Success).beverageDetail, expectedBeverage);
  });

  test('beverage repository detail beverages success iced test', () async {
    // arrange
    when(mockApiService.getIcedBeverageDetail(1)).thenAnswer((_) async => mockIcedBeverages[0]);
    final expectedBeverage = Beverage.fromResponse(mockIcedBeverages[0], BeverageType.iced);

    // act
    final result = await beverageRepository.getBeverageDetail(1, BeverageType.iced);

    // assert
    expect(result, isA<beverage_detail_result.Success>());
    expect((result as beverage_detail_result.Success).beverageDetail, expectedBeverage);
  });

  test('beverage repository detail beverages error test', () async {
    // arrange
    when(mockApiService.getHotBeverageDetail(1)).thenThrow(Exception('error'));

    // act
    final result = await beverageRepository.getBeverageDetail(1, BeverageType.hot);

    // assert
    expect(result, isA<beverage_detail_result.Error>());
    expect((result as beverage_detail_result.Error).message, Exception('error').toString());
  });
}