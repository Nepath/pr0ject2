import 'package:firebase_database/firebase_database.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable(explicitToJson: true)
class Book{

  String title;
  String year;
  String author;
  bool read;
  String id;

  Book  ({this.title, this.year, this.author, this.read , this.id});

  void setUuid(String uuid){
    this.id= uuid;
  }


  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);

}