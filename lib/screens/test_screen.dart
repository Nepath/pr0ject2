import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pr0ject2/blocs/fb_database_bloc.dart';
import 'package:pr0ject2/firebase_manager/FirebaseDatabaseManager.dart';
import 'package:pr0ject2/model/Library.dart';
import 'package:pr0ject2/model/book.dart';
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

            Book filmik = Book( year: "2020", title: "jedna", author: "spakowski", read: true, id: "asgfga");
            Book filmik1 = Book( year: "2020", title: "jaskolka", author: "spakowski", read: true, id: "sdg");
            Book filmik2 = Book( year: "2020", title: "wiosny", author: "spakowski", read: true, id: "sdghas");
            Book filmik3 = Book(read: true, year: "2020", title: "nie ", author: "spakowski", id: "asdgsadh");
            Book filmik4 = Book(read: true, year: "2020", title: "czyni", author: "spakowski", id: "zxb");
            Library lib = Library(book: filmik);
            Library lib1 = Library(book: filmik1);
            Library lib2 = Library(book: filmik2);
            Library lib3 = Library(book: filmik3);
            Library lib4 = Library(book: filmik4);
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
