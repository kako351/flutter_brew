import 'package:flutter_brew/data/infra/api_service.dart';
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_detail_result.dart' as BeverageDetailResult;
import 'package:flutter_brew/data/model/beverage_result.dart';
import 'package:flutter_brew/data/repository/beverage_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ApiService>()])
import 'beverage_repository_test.mocks.dart';

void main() {
  final List<Beverage> mockBeverages = [
    Beverage(
      id: 1,
      title: 'Black Coffee',
      description: 'Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt. Och om du vill låta fancy kan du kalla svart kaffe med sitt rätta namn: café noir.',
      ingredients: ['Coffee'],
      image: 'https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    ),
    Beverage(
      id: 2,
      title: 'Latte',
      description: 'Latte är en kaffe dryck gjord på espresso och varm ångad mjölk. Det är en italiensk ord som betyder mjölk.',
      ingredients: ['Espresso', 'Milk'],
      image: 'https://images.unsplash.com/photo-1551024501-4b3f6c0f5c6a?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    ),
  ];

  test('beverage repository success test', () async {
    // arrange
    final mockApiService = MockApiService();
    final beverageRepository = BeverageRepositoryImpl(apiClient: mockApiService);

    // act
    when(mockApiService.getBeverages()).thenAnswer((_) async => mockBeverages);
    final result = await beverageRepository.getBeverage();

    // assert
    expect(result, isA<Success>());
    expect((result as Success).beverages, mockBeverages);
  });


  test('beverage repository error test', () async {
    // arrange
    final mockApiService = MockApiService();
    final beverageRepository = BeverageRepositoryImpl(apiClient: mockApiService);

    // act
    when(mockApiService.getBeverages()).thenThrow(Exception('error'));
    final result = await beverageRepository.getBeverage();

    // assert
    expect(result, isA<Error>());
    expect((result as Error).message, Exception('error').toString());
  });

  test('beverage repository hot beverage detail success test', () async {
    // arrange
    final mockApiService = MockApiService();
    final beverageRepository = BeverageRepositoryImpl(apiClient: mockApiService);

    // act
    when(mockApiService.getHotBeverageDetail(1)).thenAnswer((_) async => mockBeverages[0]);
    final result = await beverageRepository.getHotBeverageDetail(1);

    // assert
    expect(result, isA<BeverageDetailResult.Success>());
    expect((result as BeverageDetailResult.Success).beverageDetail, mockBeverages[0]);
  });

  test('beverage repository hot beverage detail error test', () async {
    // arrange
    final mockApiService = MockApiService();
    final beverageRepository = BeverageRepositoryImpl(apiClient: mockApiService);

    // act
    when(mockApiService.getHotBeverageDetail(1)).thenThrow(Exception('error'));
    final result = await beverageRepository.getHotBeverageDetail(1);

    // assert
    expect(result, isA<BeverageDetailResult.Error>());
    expect((result as BeverageDetailResult.Error).message, Exception('error').toString());
  });
}