
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_result.dart';
import 'package:flutter_brew/data/model/beverage_type.dart';
import 'package:flutter_brew/data/repository/beverage_repository.dart';
import 'package:flutter_brew/ui/beverages_view_model.dart';
import 'package:flutter_brew/ui/viewstate/beverages_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<BeverageRepository>()])
import 'beverages_view_model_test.mocks.dart';

class Listener extends Mock {
  void call(int? previous, int value);
}

void main() {
  final List<Beverage> mockHotBeverages = [
    Beverage(
        id: 1,
        title: 'Black Coffee',
        description: 'Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt. Och om du vill låta fancy kan du kalla svart kaffe med sitt rätta namn: café noir.',
        ingredients: ['Coffee'],
        image: 'https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        type: BeverageType.hot
    ),
    Beverage(
        id: 2,
        title: 'Latte',
        description: 'Latte är en kaffe dryck gjord på espresso och varm ångad mjölk. Det är en italiensk ord som betyder mjölk.',
        ingredients: ['Espresso', 'Milk'],
        image: 'https://images.unsplash.com/photo-1551024501-4b3f6c0f5c6a?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        type: BeverageType.hot
    ),
  ];

  final List<Beverage> mockIcedBeverages = [
    Beverage(
        id: 1,
        title: 'Iced Black Coffee',
        description: 'Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat kallt. Och om du vill låta fancy kan du kalla svart kaffe med sitt rätta namn: café noir.',
        ingredients: ['Coffee'],
        image: 'https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        type: BeverageType.iced
    ),
    Beverage(
        id: 2,
        title: 'Iced Latte',
        description: 'Latte är en kaffe dryck gjord på espresso och kall mjölk. Det är en italiensk ord som betyder mjölk.',
        ingredients: ['Espresso', 'Milk'],
        image: 'https://images.unsplash.com/photo-1551024501-4b3f6c0f5c6a?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        type: BeverageType.iced
    ),
  ];

  final List<Beverage> mockBeverages = mockHotBeverages + mockIcedBeverages;

  setUp(() {
    provideDummy<BeverageResult>(Success([]));
  });

  test('beverages_view_model success test', () async {
    // arrange
    final BeverageRepository mockRepository = MockBeverageRepository();
    final viewModel = BeveragesViewModel(repository: mockRepository);
    
    // act
    when(mockRepository.getAllBeverage()).thenAnswer((_) async => Success([]));
    final result = await viewModel.getBeverages();
    
    // assert
    expect(result, isA<SuccessBeveragesViewState>());
  });

  test('beverages_view_model error test', () async {
    // arrange
    final BeverageRepository mockRepository = MockBeverageRepository();
    final viewModel = BeveragesViewModel(repository: mockRepository);

    // act
    when(mockRepository.getAllBeverage()).thenAnswer((_) async => Error('error'));
    final result = await viewModel.getBeverages();

    // assert
    expect(result, isA<ErrorBeveragesViewState>());
  });

  test('beverages_view_model updateSelectedType hot test', () async {
    // arrange
    final BeverageRepository mockRepository = MockBeverageRepository();
    final type = BeverageType.hot;
    final container = ProviderContainer(
      overrides: [
        beveragesViewModelProvider.overrideWith(() { return BeveragesViewModel(repository: mockRepository); })
      ],
    );
    addTearDown(container.dispose);
    final viewModel = container.listen(beveragesViewModelProvider.notifier, (previous, next) {}).read();

    // act
    when(mockRepository.getAllBeverage()).thenAnswer((_) async => Success(mockBeverages));
    await viewModel.getBeverages();
    viewModel.updateSelectedType(type);

    // assert
    final state = viewModel.state.value as SuccessBeveragesViewState;
    expect(state.beverages, mockHotBeverages);
    expect(state.type, type);
  });

  test('beverages_view_model getBeveragesByType iced test', () async {
    // arrange
    final BeverageRepository mockRepository = MockBeverageRepository();
    final type = BeverageType.iced;
    final container = ProviderContainer(
      overrides: [
        beveragesViewModelProvider.overrideWith(() { return BeveragesViewModel(repository: mockRepository); })
      ],
    );
    addTearDown(container.dispose);
    final viewModel = container.listen(beveragesViewModelProvider.notifier, (previous, next) {}).read();

    // act
    when(mockRepository.getAllBeverage()).thenAnswer((_) async => Success(mockBeverages));
    await viewModel.getBeverages();
    viewModel.updateSelectedType(type);

    // assert
    final state = viewModel.state.value as SuccessBeveragesViewState;
    expect(state.beverages, mockIcedBeverages);
    expect(state.type, type);
  });

  test('beverages_view_model getBeveragesByType all test', () async {
    // arrange
    final BeverageRepository mockRepository = MockBeverageRepository();
    final type = BeverageType.all;
    final container = ProviderContainer(
      overrides: [
        beveragesViewModelProvider.overrideWith(() { return BeveragesViewModel(repository: mockRepository); })
      ],
    );
    addTearDown(container.dispose);
    final viewModel = container.listen(beveragesViewModelProvider.notifier, (previous, next) {}).read();

    // act
    when(mockRepository.getAllBeverage()).thenAnswer((_) async => Success(mockBeverages));
    await viewModel.getBeverages();
    viewModel.updateSelectedType(type);

    // assert
    final state = viewModel.state.value as SuccessBeveragesViewState;
    expect(state.beverages, mockBeverages);
    expect(state.type, type);
  });
}
