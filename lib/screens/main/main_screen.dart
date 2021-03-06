import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pr0ject2/blocs/omdb_bloc.dart';
import 'package:pr0ject2/enum/record_type.dart';
import 'package:pr0ject2/firebase_manager/FirebaseDatabaseManager.dart';
import 'package:pr0ject2/model/Library.dart';
import 'package:pr0ject2/model/MovieT.dart';
import 'package:pr0ject2/model/movie.dart';
import 'package:pr0ject2/screens/api_search/api_search.dart';
import 'package:pr0ject2/screens/books/books_screen.dart';
import 'package:pr0ject2/screens/games/games_screen.dart';
import 'package:pr0ject2/screens/movies/movies_screen.dart';
import 'package:pr0ject2/widgets/add_position_to_database.dart';

import '../test_screen.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {

  TabController _tabController;
  OmdbBloc _omdbBloc;

  List<Widget> _widgetOptions = <Widget>[
    GamesScreen(),
    MoviesScreen(),
    BooksScreen(),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
    _omdbBloc = BlocProvider.getBloc();
    _omdbBloc.movieStream.listen(onData);
    super.initState();
  }

  void _handleTabIndex(){
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: _bottomButtons(),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            MoviesScreen(),
            GamesScreen(),
            BooksScreen(),
          ],
        ),
        bottomNavigationBar: TabBar(
          indicatorColor: _indicatorColor(),
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.movie),
              text: "Filmy",
            ),
            Tab(
              icon: Icon(Icons.videogame_asset),
              text: "Gry",
            ),
            Tab(
              icon: Icon(Icons.book),
              text: "Książki",
            )
          ],
        ),
      ),

    );
  }

  void onData(MovieT hahahahahahah){
    final widzecik = TestTest(movieT: hahahahahahah,);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => widzecik));
  }

  Color _indicatorColor(){
    if(_tabController.index==0){
      return Colors.blueAccent;
    }
    else if (_tabController.index==1 ){
      return Colors.orangeAccent;
    }
    else if( _tabController.index==2){
      return Colors.greenAccent;
    }
  }

  Widget _bottomButtons(){
    if(_tabController.index==0){
      return
        FloatingActionButton(
          shape: StadiumBorder(),
          onPressed: (){Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SearchForMovieScreen(), ));},
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.add, size: 20,),
        );
    }
    else if(_tabController.index==1){
      return
        FloatingActionButton(
          shape: StadiumBorder(),
          onPressed: (){Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddPositionToDatabase(RecordType.GAMEADD), ));},
          backgroundColor: Colors.orangeAccent,
          child: Icon(Icons.add, size: 20,),
        );
    }
    else if(_tabController.index==2){
      return
        FloatingActionButton(
          shape: StadiumBorder(),
          onPressed: (){Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddPositionToDatabase(RecordType.BOOKADD,), ));
          },
          backgroundColor: Colors.greenAccent,
          child: Icon(Icons.add, size: 20,),
        );
    }


  }
}
