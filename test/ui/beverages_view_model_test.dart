
import 'package:flutter_brew/data/model/beverage_result.dart';
import 'package:flutter_brew/data/repository/beverage_repository.dart';
import 'package:flutter_brew/ui/beverages_view_model.dart';
import 'package:flutter_brew/ui/viewstate/beverages_view_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<BeverageRepository>()])
import 'beverages_view_model_test.mocks.dart';

void main() {
  setUp(() {
    provideDummy<BeverageResult>(Success([]));
  });

  test('beverages_view_model success test', () async {
    // arrange
    final BeverageRepository mockRepository = MockBeverageRepository();
    final viewModel = BeveragesViewModel(repository: mockRepository);
    
    // act
    when(mockRepository.getHotBeverage()).thenAnswer((_) async => Success([]));
    final result = await viewModel.getBeverages();
    
    // assert
    expect(result, isA<SuccessBeveragesViewState>());
  });

  test('beverages_view_model error test', () async {
    // arrange
    final BeverageRepository mockRepository = MockBeverageRepository();
    final viewModel = BeveragesViewModel(repository: mockRepository);

    // act
    when(mockRepository.getHotBeverage()).thenAnswer((_) async => Error('error'));
    final result = await viewModel.getBeverages();

    // assert
    expect(result, isA<ErrorBeveragesViewState>());
  });
}