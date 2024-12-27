import 'package:flutter_brew/data/infra/response/beverage_response.dart';
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const mockJson = {
    'title': 'Black Coffee',
    'description': 'Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt. Och om du vill låta fancy kan du kalla svart kaffe med sitt rätta namn: café noir.',
    'ingredients': [
      'Coffee'
    ],
    'image': 'https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'id': 1
  };

  test('beverage model test', () async {
    final beverage = Beverage.fromResponse(BeverageResponse.fromJson(mockJson), BeverageType.hot);
    expect(beverage.id, 1);
    expect(beverage.title, 'Black Coffee');
    expect(beverage.description, 'Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt. Och om du vill låta fancy kan du kalla svart kaffe med sitt rätta namn: café noir.');
    expect(beverage.ingredients, ['Coffee']);
    expect(beverage.image, 'https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
    expect(beverage.type, BeverageType.hot);
  });
}