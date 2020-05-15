import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(explicitToJson: true)
class Movie{
  String title;
  String year;
  String director;
  bool watched;
  String id;

  Movie({this.year,this.title,this.director,this.id,this.watched});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}