import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pr0ject2/blocs/fb_database_bloc.dart';
import 'package:pr0ject2/firebase_manager/FirebaseDatabaseManager.dart';
import 'package:pr0ject2/model/Library.dart';
import 'package:pr0ject2/model/book.dart';
import 'package:pr0ject2/model/game.dart';
import 'package:pr0ject2/model/movie.dart';

class TestTest extends StatefulWidget {
  @override
  _TestTestState createState() => _TestTestState();
}

class _TestTestState extends State<TestTest> {

  DatabaseBloc _databaseBloc;
  StreamSubscription _registerSubscription;

  @override
  void initState() {
    _databaseBloc = BlocProvider.getBloc();
    _registerSubscription = _databaseBloc.onMovieAdded.listen(testowyvoid);
//        .loadingLoginRegister.listen(loadingScreen)
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: RaisedButton(
          onPressed: (){

            FBDataBaseManager test = FBDataBaseManager();

            Game filmik = Game(year: "asedgf", title: "asdgsdg", id: "idik", played: false, producer: "polaki");
            Game filmik1 = Game(year: "asedgf", title: "asdgsdg", id: "idifgk", played: false, producer: "polaki");
            Game filmik2 = Game(year: "asedgf", title: "asdgsdg", id: "idvbik", played: false, producer: "polaki");
            Game filmik3 = Game(year: "asedgf", title: "asdgsdg", id: "idxcik", played: false, producer: "polaki");
            Game filmik4 = Game(year: "asedgf", title: "asdgsdg", id: "idasdasik", played: false, producer: "polaki");
            Library lib = Library(game: filmik);
            Library lib1 = Library(game: filmik1);
            Library lib2 = Library(game: filmik2);
            Library lib3 = Library(game: filmik3);
            Library lib4 = Library(game: filmik4);
            test.saveDataToDatabase("user", lib);
            test.saveDataToDatabase("user", lib1);
            test.saveDataToDatabase("user", lib2);
            test.saveDataToDatabase("user", lib3);
            test.saveDataToDatabase("user", lib4);
          },
        ),
      ),
    );
  }
  void testowyvoid(Library lista){
    print(lista.movie.year);
  }
}
