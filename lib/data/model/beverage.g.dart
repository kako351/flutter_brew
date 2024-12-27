// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beverage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BeverageImpl _$$BeverageImplFromJson(Map<String, dynamic> json) =>
    _$BeverageImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      image: json['image'] as String,
      id: (json['id'] as num).toInt(),
      type: $enumDecode(_$BeverageTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$BeverageImplToJson(_$BeverageImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'ingredients': instance.ingredients,
      'image': instance.image,
      'id': instance.id,
      'type': _$BeverageTypeEnumMap[instance.type]!,
    };

const _$BeverageTypeEnumMap = {
  BeverageType.hot: 'hot',
  BeverageType.iced: 'iced',
  BeverageType.all: 'all',
};
