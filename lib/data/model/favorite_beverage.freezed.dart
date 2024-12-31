// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_beverage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavoriteBeverage {
  int get id => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;

  /// Create a copy of FavoriteBeverage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavoriteBeverageCopyWith<FavoriteBeverage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteBeverageCopyWith<$Res> {
  factory $FavoriteBeverageCopyWith(
          FavoriteBeverage value, $Res Function(FavoriteBeverage) then) =
      _$FavoriteBeverageCopyWithImpl<$Res, FavoriteBeverage>;
  @useResult
  $Res call({int id, bool isFavorite});
}

/// @nodoc
class _$FavoriteBeverageCopyWithImpl<$Res, $Val extends FavoriteBeverage>
    implements $FavoriteBeverageCopyWith<$Res> {
  _$FavoriteBeverageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteBeverage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isFavorite = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteBeverageImplCopyWith<$Res>
    implements $FavoriteBeverageCopyWith<$Res> {
  factory _$$FavoriteBeverageImplCopyWith(_$FavoriteBeverageImpl value,
          $Res Function(_$FavoriteBeverageImpl) then) =
      __$$FavoriteBeverageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, bool isFavorite});
}

/// @nodoc
class __$$FavoriteBeverageImplCopyWithImpl<$Res>
    extends _$FavoriteBeverageCopyWithImpl<$Res, _$FavoriteBeverageImpl>
    implements _$$FavoriteBeverageImplCopyWith<$Res> {
  __$$FavoriteBeverageImplCopyWithImpl(_$FavoriteBeverageImpl _value,
      $Res Function(_$FavoriteBeverageImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteBeverage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isFavorite = null,
  }) {
    return _then(_$FavoriteBeverageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FavoriteBeverageImpl extends _FavoriteBeverage {
  _$FavoriteBeverageImpl(
      {this.id = Isar.autoIncrement, required this.isFavorite})
      : super._();

  @override
  @JsonKey()
  final int id;
  @override
  final bool isFavorite;

  @override
  String toString() {
    return 'FavoriteBeverage(id: $id, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteBeverageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, isFavorite);

  /// Create a copy of FavoriteBeverage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteBeverageImplCopyWith<_$FavoriteBeverageImpl> get copyWith =>
      __$$FavoriteBeverageImplCopyWithImpl<_$FavoriteBeverageImpl>(
          this, _$identity);
}

abstract class _FavoriteBeverage extends FavoriteBeverage {
  factory _FavoriteBeverage({final int id, required final bool isFavorite}) =
      _$FavoriteBeverageImpl;
  _FavoriteBeverage._() : super._();

  @override
  int get id;
  @override
  bool get isFavorite;

  /// Create a copy of FavoriteBeverage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoriteBeverageImplCopyWith<_$FavoriteBeverageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
