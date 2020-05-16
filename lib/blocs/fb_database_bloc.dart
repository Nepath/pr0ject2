import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/foundation.dart';
import 'package:pr0ject2/firebase_manager/FirebaseAuthManager.dart';
import 'package:pr0ject2/firebase_manager/FirebaseDatabaseManager.dart';
import 'package:pr0ject2/model/Library.dart';
import 'package:rxdart/rxdart.dart';

class DatabaseBloc extends BlocBase {

  String userUid = "user";
  final dataBaseManager = FBDataBaseManager();

  BehaviorSubject<bool> _changesInDatabaseItem = BehaviorSubject();
  Stream<bool> get changesInDatabaseObservable => _changesInDatabaseItem.stream;

  Stream<Library> get onMovieChanged => dataBaseManager.catchMovieUpdate();
  Stream<Library> get onMovieAdded => dataBaseManager.onMovieAdded();

  BehaviorSubject<Library> _deletedMovie = BehaviorSubject();
  Stream<Library> get deletedMovieIdObservable => _deletedMovie.stream;

  BehaviorSubject<Library> _deletedGame = BehaviorSubject();
  Stream<Library> get deletedGameIdObservable => _deletedGame.stream;

  BehaviorSubject<Library> _deletedBook = BehaviorSubject();
  Stream<Library> get deletedBookIdObservable => _deletedBook.stream;

  Stream<Library> get onGameChanged => dataBaseManager.catchMovieUpdate();
  Stream<Library> get onGameCAdded => dataBaseManager.onGameAdded();

  Stream<Library> get onBookChanged => dataBaseManager.catchMovieUpdate();
  Stream<Library> get onBookAdded => dataBaseManager.onBookAdded();

  Future addItemToFireBaseDatabase(Library library) async {
    dataBaseManager.saveDataToDatabase(userUid, library);
    _changesInDatabaseItem.add(true);
    _changesInDatabaseItem.add(false);
  }
  Future removeItemFromFireBaseDatabase(Library library) async {
    if(library.game!=null){
      _deletedGame.add(library);
    }
    else if(library.movie!=null){
      _deletedMovie.add(library);
    }
    else if(library.book!=null){
      _deletedBook.add(library);
    }
    dataBaseManager.removeItem(userUid, library);
    _changesInDatabaseItem.add(true);
    _changesInDatabaseItem.add(false);
  }
}