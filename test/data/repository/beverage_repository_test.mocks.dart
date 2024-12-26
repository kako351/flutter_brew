// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_brew/test/data/repository/beverage_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_brew/data/infra/api_service.dart' as _i3;
import 'package:flutter_brew/data/model/beverage.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeBeverage_0 extends _i1.SmartFake implements _i2.Beverage {
  _FakeBeverage_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i3.ApiService {
  @override
  _i4.Future<List<_i2.Beverage>> getHotBeverages() => (super.noSuchMethod(
        Invocation.method(
          #getHotBeverages,
          [],
        ),
        returnValue: _i4.Future<List<_i2.Beverage>>.value(<_i2.Beverage>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i2.Beverage>>.value(<_i2.Beverage>[]),
      ) as _i4.Future<List<_i2.Beverage>>);

  @override
  _i4.Future<_i2.Beverage> getHotBeverageDetail(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getHotBeverageDetail,
          [id],
        ),
        returnValue: _i4.Future<_i2.Beverage>.value(_FakeBeverage_0(
          this,
          Invocation.method(
            #getHotBeverageDetail,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Beverage>.value(_FakeBeverage_0(
          this,
          Invocation.method(
            #getHotBeverageDetail,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Beverage>);
}
