// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_brew/test/data/repository/beverage_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:flutter_brew/data/infra/api_service.dart' as _i4;
import 'package:flutter_brew/data/infra/response/beverage_response.dart' as _i2;
import 'package:flutter_brew/data/local/local_beverages.dart' as _i6;
import 'package:flutter_brew/data/model/beverage.dart' as _i7;
import 'package:isar/isar.dart' as _i3;
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

class _FakeBeverageResponse_0 extends _i1.SmartFake
    implements _i2.BeverageResponse {
  _FakeBeverageResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIsar_1 extends _i1.SmartFake implements _i3.Isar {
  _FakeIsar_1(
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
class MockApiService extends _i1.Mock implements _i4.ApiService {
  @override
  _i5.Future<List<_i2.BeverageResponse>> getHotBeverages() =>
      (super.noSuchMethod(
        Invocation.method(
          #getHotBeverages,
          [],
        ),
        returnValue: _i5.Future<List<_i2.BeverageResponse>>.value(
            <_i2.BeverageResponse>[]),
        returnValueForMissingStub: _i5.Future<List<_i2.BeverageResponse>>.value(
            <_i2.BeverageResponse>[]),
      ) as _i5.Future<List<_i2.BeverageResponse>>);

  @override
  _i5.Future<_i2.BeverageResponse> getHotBeverageDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getHotBeverageDetail,
          [id],
        ),
        returnValue:
            _i5.Future<_i2.BeverageResponse>.value(_FakeBeverageResponse_0(
          this,
          Invocation.method(
            #getHotBeverageDetail,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.BeverageResponse>.value(_FakeBeverageResponse_0(
          this,
          Invocation.method(
            #getHotBeverageDetail,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.BeverageResponse>);

  @override
  _i5.Future<List<_i2.BeverageResponse>> getIcedBeverages() =>
      (super.noSuchMethod(
        Invocation.method(
          #getIcedBeverages,
          [],
        ),
        returnValue: _i5.Future<List<_i2.BeverageResponse>>.value(
            <_i2.BeverageResponse>[]),
        returnValueForMissingStub: _i5.Future<List<_i2.BeverageResponse>>.value(
            <_i2.BeverageResponse>[]),
      ) as _i5.Future<List<_i2.BeverageResponse>>);

  @override
  _i5.Future<_i2.BeverageResponse> getIcedBeverageDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getIcedBeverageDetail,
          [id],
        ),
        returnValue:
            _i5.Future<_i2.BeverageResponse>.value(_FakeBeverageResponse_0(
          this,
          Invocation.method(
            #getIcedBeverageDetail,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.BeverageResponse>.value(_FakeBeverageResponse_0(
          this,
          Invocation.method(
            #getIcedBeverageDetail,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.BeverageResponse>);
}

/// A class which mocks [LocalBeverages].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalBeverages extends _i1.Mock implements _i6.LocalBeverages {
  @override
  _i3.Isar get isar => (super.noSuchMethod(
        Invocation.getter(#isar),
        returnValue: _FakeIsar_1(
          this,
          Invocation.getter(#isar),
        ),
        returnValueForMissingStub: _FakeIsar_1(
          this,
          Invocation.getter(#isar),
        ),
      ) as _i3.Isar);

  @override
  _i5.Future<List<_i7.Beverage>> getBeverages() => (super.noSuchMethod(
        Invocation.method(
          #getBeverages,
          [],
        ),
        returnValue: _i5.Future<List<_i7.Beverage>>.value(<_i7.Beverage>[]),
        returnValueForMissingStub:
            _i5.Future<List<_i7.Beverage>>.value(<_i7.Beverage>[]),
      ) as _i5.Future<List<_i7.Beverage>>);

  @override
  _i5.Future<List<_i7.Beverage>> getHotBeverages() => (super.noSuchMethod(
        Invocation.method(
          #getHotBeverages,
          [],
        ),
        returnValue: _i5.Future<List<_i7.Beverage>>.value(<_i7.Beverage>[]),
        returnValueForMissingStub:
            _i5.Future<List<_i7.Beverage>>.value(<_i7.Beverage>[]),
      ) as _i5.Future<List<_i7.Beverage>>);

  @override
  _i5.Future<List<_i7.Beverage>> getIcedBeverages() => (super.noSuchMethod(
        Invocation.method(
          #getIcedBeverages,
          [],
        ),
        returnValue: _i5.Future<List<_i7.Beverage>>.value(<_i7.Beverage>[]),
        returnValueForMissingStub:
            _i5.Future<List<_i7.Beverage>>.value(<_i7.Beverage>[]),
      ) as _i5.Future<List<_i7.Beverage>>);

  @override
  _i5.Future<void> saveBeverages(List<_i7.Beverage>? beverages) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveBeverages,
          [beverages],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<List<_i7.Beverage>> findSearchWords(String? words) =>
      (super.noSuchMethod(
        Invocation.method(
          #findSearchWords,
          [words],
        ),
        returnValue: _i5.Future<List<_i7.Beverage>>.value(<_i7.Beverage>[]),
        returnValueForMissingStub:
            _i5.Future<List<_i7.Beverage>>.value(<_i7.Beverage>[]),
      ) as _i5.Future<List<_i7.Beverage>>);
}
