import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pr0ject2/blocs/fb_database_bloc.dart';
import 'package:pr0ject2/model/Library.dart';
import 'package:pr0ject2/screens/movies/content/movie_item.dart';

class MoviesContent extends StatefulWidget {
  @override
  _MoviesContentState createState() => _MoviesContentState();
}

class _MoviesContentState extends State<MoviesContent> {

  List<Library> listofMovies = [];
  DatabaseBloc _databaseBloc;

  @override
  void initState() {
    _databaseBloc = BlocProvider.getBloc();
    _databaseBloc.deletedMovieIdObservable.listen(onDeletedMovie);
    _databaseBloc.onMovieAdded.listen(onMovieAdded);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
            child: ListView.builder(
              itemCount: listofMovies.length,
              itemBuilder: (_, position) { return new MovieItem(listofMovies[position]);},
            )
        )
    );
  }

  void onMovieAdded(Library library){
    setState(() {
      listofMovies.add(library);
    });
  }

  void onDeletedMovie(Library library){
    setState(() {
      listofMovies.removeWhere((item) => item.getItemId() == library.getItemId());
    });
  }
}
