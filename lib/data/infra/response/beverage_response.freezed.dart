// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beverage_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BeverageResponse _$BeverageResponseFromJson(Map<String, dynamic> json) {
  return _BeverageResponse.fromJson(json);
}

/// @nodoc
mixin _$BeverageResponse {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get ingredients => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  /// Serializes this BeverageResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BeverageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BeverageResponseCopyWith<BeverageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeverageResponseCopyWith<$Res> {
  factory $BeverageResponseCopyWith(
          BeverageResponse value, $Res Function(BeverageResponse) then) =
      _$BeverageResponseCopyWithImpl<$Res, BeverageResponse>;
  @useResult
  $Res call(
      {String title,
      String description,
      List<String> ingredients,
      String image,
      int id});
}

/// @nodoc
class _$BeverageResponseCopyWithImpl<$Res, $Val extends BeverageResponse>
    implements $BeverageResponseCopyWith<$Res> {
  _$BeverageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BeverageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? ingredients = null,
    Object? image = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BeverageResponseImplCopyWith<$Res>
    implements $BeverageResponseCopyWith<$Res> {
  factory _$$BeverageResponseImplCopyWith(_$BeverageResponseImpl value,
          $Res Function(_$BeverageResponseImpl) then) =
      __$$BeverageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      List<String> ingredients,
      String image,
      int id});
}

/// @nodoc
class __$$BeverageResponseImplCopyWithImpl<$Res>
    extends _$BeverageResponseCopyWithImpl<$Res, _$BeverageResponseImpl>
    implements _$$BeverageResponseImplCopyWith<$Res> {
  __$$BeverageResponseImplCopyWithImpl(_$BeverageResponseImpl _value,
      $Res Function(_$BeverageResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of BeverageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? ingredients = null,
    Object? image = null,
    Object? id = null,
  }) {
    return _then(_$BeverageResponseImpl(
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BeverageResponseImpl extends _BeverageResponse {
  const _$BeverageResponseImpl(
      {required this.title,
      required this.description,
      required final List<String> ingredients,
      required this.image,
      required this.id})
      : _ingredients = ingredients,
        super._();

  factory _$BeverageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BeverageResponseImplFromJson(json);

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
  final int id;

  @override
  String toString() {
    return 'BeverageResponse(title: $title, description: $description, ingredients: $ingredients, image: $image, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeverageResponseImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description,
      const DeepCollectionEquality().hash(_ingredients), image, id);

  /// Create a copy of BeverageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BeverageResponseImplCopyWith<_$BeverageResponseImpl> get copyWith =>
      __$$BeverageResponseImplCopyWithImpl<_$BeverageResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BeverageResponseImplToJson(
      this,
    );
  }
}

abstract class _BeverageResponse extends BeverageResponse {
  const factory _BeverageResponse(
      {required final String title,
      required final String description,
      required final List<String> ingredients,
      required final String image,
      required final int id}) = _$BeverageResponseImpl;
  const _BeverageResponse._() : super._();

  factory _BeverageResponse.fromJson(Map<String, dynamic> json) =
      _$BeverageResponseImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  List<String> get ingredients;
  @override
  String get image;
  @override
  int get id;

  /// Create a copy of BeverageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BeverageResponseImplCopyWith<_$BeverageResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
