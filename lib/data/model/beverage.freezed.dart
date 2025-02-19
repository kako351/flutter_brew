// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beverage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Beverage _$BeverageFromJson(Map<String, dynamic> json) {
  return _Beverage.fromJson(json);
}

/// @nodoc
mixin _$Beverage {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get ingredients => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get beverageId => throw _privateConstructorUsedError;
  BeverageType get type => throw _privateConstructorUsedError;

  /// Serializes this Beverage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Beverage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BeverageCopyWith<Beverage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeverageCopyWith<$Res> {
  factory $BeverageCopyWith(Beverage value, $Res Function(Beverage) then) =
      _$BeverageCopyWithImpl<$Res, Beverage>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      List<String> ingredients,
      String image,
      int beverageId,
      BeverageType type});
}

/// @nodoc
class _$BeverageCopyWithImpl<$Res, $Val extends Beverage>
    implements $BeverageCopyWith<$Res> {
  _$BeverageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Beverage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? ingredients = null,
    Object? image = null,
    Object? beverageId = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      beverageId: null == beverageId
          ? _value.beverageId
          : beverageId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BeverageType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BeverageImplCopyWith<$Res>
    implements $BeverageCopyWith<$Res> {
  factory _$$BeverageImplCopyWith(
          _$BeverageImpl value, $Res Function(_$BeverageImpl) then) =
      __$$BeverageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      List<String> ingredients,
      String image,
      int beverageId,
      BeverageType type});
}

/// @nodoc
class __$$BeverageImplCopyWithImpl<$Res>
    extends _$BeverageCopyWithImpl<$Res, _$BeverageImpl>
    implements _$$BeverageImplCopyWith<$Res> {
  __$$BeverageImplCopyWithImpl(
      _$BeverageImpl _value, $Res Function(_$BeverageImpl) _then)
      : super(_value, _then);

  /// Create a copy of Beverage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? ingredients = null,
    Object? image = null,
    Object? beverageId = null,
    Object? type = null,
  }) {
    return _then(_$BeverageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      beverageId: null == beverageId
          ? _value.beverageId
          : beverageId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BeverageType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BeverageImpl extends _Beverage {
  _$BeverageImpl(
      {this.id = Isar.autoIncrement,
      required this.title,
      required this.description,
      required final List<String> ingredients,
      required this.image,
      required this.beverageId,
      required this.type})
      : _ingredients = ingredients,
        super._();

  factory _$BeverageImpl.fromJson(Map<String, dynamic> json) =>
      _$$BeverageImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final String title;
  @override
  final String description;
  final List<String> _ingredients;
  @override
  List<String> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  final String image;
  @override
  final int beverageId;
  @override
  final BeverageType type;

  @override
  String toString() {
    return 'Beverage(id: $id, title: $title, description: $description, ingredients: $ingredients, image: $image, beverageId: $beverageId, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeverageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.beverageId, beverageId) ||
                other.beverageId == beverageId) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      const DeepCollectionEquality().hash(_ingredients),
      image,
      beverageId,
      type);

  /// Create a copy of Beverage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BeverageImplCopyWith<_$BeverageImpl> get copyWith =>
      __$$BeverageImplCopyWithImpl<_$BeverageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BeverageImplToJson(
      this,
    );
  }
}

abstract class _Beverage extends Beverage {
  factory _Beverage(
      {final int id,
      required final String title,
      required final String description,
      required final List<String> ingredients,
      required final String image,
      required final int beverageId,
      required final BeverageType type}) = _$BeverageImpl;
  _Beverage._() : super._();

  factory _Beverage.fromJson(Map<String, dynamic> json) =
      _$BeverageImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  List<String> get ingredients;
  @override
  String get image;
  @override
  int get beverageId;
  @override
  BeverageType get type;

  /// Create a copy of Beverage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BeverageImplCopyWith<_$BeverageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
