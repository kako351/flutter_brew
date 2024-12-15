import 'package:flutter_brew/data/infra/api_service.dart';
import 'package:flutter_brew/data/model/beverage.dart';
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

  test('beverage repository test', () async {
    // arrange
    final mockApiService = MockApiService();
    final beverageRepository = BeverageRepositoryImpl(mockApiService);

    // act
    when(mockApiService.getBeverages()).thenAnswer((_) async => mockBeverages);

    // assert
    expect(await beverageRepository.getBeverage(), [
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
    ]);
  });
}