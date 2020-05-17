import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pr0ject2/blocs/fb_database_bloc.dart';
import 'package:pr0ject2/blocs/omdb_bloc.dart';
import 'package:pr0ject2/enum/record_type.dart';
import 'package:pr0ject2/model/Library.dart';
import 'package:pr0ject2/model/MovieT.dart';
import 'package:pr0ject2/model/movie.dart';
import 'package:pr0ject2/model/movie_s.dart';
import 'package:pr0ject2/screens/test_screen.dart';
import 'package:pr0ject2/widgets/add_position_to_database.dart';

class MovieItem extends StatefulWidget {

  bool is_Search = false;

  Library movie;
  MovieItem(this.movie);
  MovieS movieS;


  MovieItem.Search({this.is_Search, this.movieS}){
    movie = Library(movie: Movie(year: movieS.year,title: movieS.title,id: movieS.id));
  }

  @override
  _MovieItemState createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {

  Library movie;
  OmdbBloc _omdbBloc;
  DatabaseBloc _databaseBloc;

  @override
  void initState() {
    _databaseBloc = BlocProvider.getBloc();
    _omdbBloc = BlocProvider.getBloc();
    _omdbBloc.movieStream.listen(onData);
    movie = widget.movie;
    super.initState();
  }

  void onData(MovieT hahahahahahah){
    final widzecik = TestTest(movieT: hahahahahahah,);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => widzecik));
  }

  @override
  void dispose() {
    super.dispose();
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
        child: InkWell(
          onTap: (){
            _omdbBloc.getTitle(movie.getItemId());
          },
          child: ListTile(
            leading: Icon(Icons.movie , size: 50,),
            title: Text("Tytuł: ${movie.movie.title}", style: TextStyle(fontSize: 20,),),
            subtitle: Text("Autor:" + getDirectorXD() + "\nRok wydania: ${movie.movie.year}"),
            trailing: InkWell(
              onTap: widget.is_Search ?
                  (){
                    _databaseBloc.addItemToFireBaseDatabase(movie);
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
      ),
    );
  }

  String getDirectorXD(){
    if(movie.movie.director==null){
      return "Brak".toString();
    }
    else{
      return movie.movie.director.toString();
    }
  }

  void DeleteMovie(){
    _databaseBloc.removeItemFromFireBaseDatabase(movie);
  }
}
