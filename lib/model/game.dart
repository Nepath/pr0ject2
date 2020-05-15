import 'package:json_annotation/json_annotation.dart';

part 'game.g.dart';

@JsonSerializable(explicitToJson: true)
class Game{

  String id;
  String title;
  String year;
  String producer;
  bool played;

  Game({this.title, this.year, this.producer, this.played, this.id});

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
  Map<String, dynamic> toJson() => _$GameToJson(this);
}