import 'package:flutter/material.dart';
import 'package:pr0ject2/api/omdb_api_provider.dart';
import 'package:pr0ject2/blocs/fb_database_bloc.dart';
import 'package:pr0ject2/blocs/log_reg_bloc.dart';
import 'package:pr0ject2/blocs/omdb_bloc.dart';
import 'package:pr0ject2/repositories/omdb_repository.dart';
import 'package:pr0ject2/screens/login_register/login_register_layout.dart';
import 'package:pr0ject2/screens/main/main_screen.dart';
import 'package:pr0ject2/screens/movies/movies_screen.dart';
import 'package:pr0ject2/screens/test_screen.dart';
import 'firebase_manager/FirebaseAuthManager.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: _blocs,
      dependencies: _dependencies,
      child: MaterialApp(
        title: 'pr0ject2',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink[900],
          accentColor: Colors.pink[500],
          brightness: Brightness.dark
        ),
        home: LoginRegisterScreen()
      ),
    );
  }

  List<Bloc> get _blocs => [
    Bloc((_) => LogRegBloc()),
    Bloc((_) => DatabaseBloc()),
    Bloc((i) => OmdbBloc(i.get())),
  ];

  List<Dependency> get _dependencies =>[
    Dependency((_) => Dio()),
    Dependency((i) => OmdbMoviesProvider(i.get())),
    Dependency((i) => OmdbRepository(i.get())),
  ];

}



