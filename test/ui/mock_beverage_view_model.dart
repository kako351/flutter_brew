import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_type.dart';
import 'package:flutter_brew/ui/beverages_view_model.dart';
import 'package:flutter_brew/ui/viewstate/beverages_view_state.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mock_beverage_view_model.g.dart';

@riverpod
class MockBeverageViewModel extends _$MockBeverageViewModel
    with Mock
    implements BeveragesViewModel {

  @override
  Future<BeveragesViewState> build() async {
    return SuccessBeveragesViewState([
      Beverage(
          beverageId: 1,
          title: 'Black Coffee',
          description: 'Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt. Och om du vill låta fancy kan du kalla svart kaffe med sitt rätta namn: café noir.',
          ingredients: ['Coffee'],
          image: 'https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          type: BeverageType.hot
      ),
    ], BeverageType.defaultValue);
  }

  @override
  Future<void> updateSearchHistories(String words) async {
    return Future.value();
  }
}