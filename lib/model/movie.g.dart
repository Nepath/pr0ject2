// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    year: json['year'] as String,
    title: json['title'] as String,
    director: json['director'] as String,
    id: json['id'] as String,
    watched: json['watched'] as bool,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'title': instance.title,
      'year': instance.year,
      'director': instance.director,
      'watched': instance.watched,
      'id': instance.id,
    };
