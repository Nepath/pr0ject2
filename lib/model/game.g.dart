// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) {
  return Game(
    title: json['title'] as String,
    year: json['year'] as String,
    producer: json['producer'] as String,
    played: json['played'] as bool,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'year': instance.year,
      'producer': instance.producer,
      'played': instance.played,
    };
