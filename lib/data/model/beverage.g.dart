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
    );

Map<String, dynamic> _$$BeverageImplToJson(_$BeverageImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'ingredients': instance.ingredients,
      'image': instance.image,
      'id': instance.id,
    };
