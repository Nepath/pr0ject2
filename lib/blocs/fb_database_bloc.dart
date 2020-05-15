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

  Stream<Library> get onMovieChanged => dataBaseManager.catchMovieUpdate();
  Stream<Library> get onMovieAdded => dataBaseManager.onMovieAdded();

  Stream<Library> get onGameChanged => dataBaseManager.catchMovieUpdate();
  Stream<Library> get onGameCAdded => dataBaseManager.onGameAdded();

  Stream<Library> get onBookChanged => dataBaseManager.catchMovieUpdate();
  Stream<Library> get onBookAdded => dataBaseManager.onBookAdded();

  Future addItemToFireBaseDatabase(Library library) async {
    dataBaseManager.saveDataToDatabase(userUid, library);
  }
  Future removeItemFromFireBaseDatabase(Library library) async {
    dataBaseManager.removeItem(userUid, library);
  }
}