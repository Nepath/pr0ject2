import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pr0ject2/blocs/fb_database_bloc.dart';
import 'package:pr0ject2/enum/record_type.dart';
import 'package:pr0ject2/model/Library.dart';
import 'package:pr0ject2/widgets/add_position_to_database.dart';

class MovieItem extends StatefulWidget {

  bool is_Search = false;

  Library movie;
  MovieItem(this.movie);


  MovieItem.Search({this.is_Search});

  @override
  _MovieItemState createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {

  Library movie;

  DatabaseBloc _databaseBloc;

  @override
  void initState() {
    _databaseBloc = BlocProvider.getBloc();
    movie = widget.movie;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff2e2e2e),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.blueAccent),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent[100],
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(Icons.movie , size: 50,),
          title: Text("Tytuł: ${movie.movie.title}", style: TextStyle(fontSize: 20,),),
          subtitle: Text("Autor: ${movie.movie.director} \nRok wydania: ${movie.movie.year}"),
          trailing: InkWell(
            onTap: widget.is_Search ?
                (){

            }
            :
                (){
              DeleteMovie();
            },
              child: widget.is_Search ? Icon(Icons.add) : Icon(Icons.delete)
          ),
          isThreeLine: true,
        ),
      ),
    );
  }

  void DeleteMovie(){
    _databaseBloc.removeItemFromFireBaseDatabase(widget.movie);
  }
}
