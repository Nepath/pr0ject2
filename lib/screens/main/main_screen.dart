import 'package:flutter/material.dart';
import 'package:pr0ject2/screens/books/books_screen.dart';
import 'package:pr0ject2/screens/games/games_screen.dart';
import 'package:pr0ject2/screens/movies/movies_screen.dart';

class MainScreen extends StatelessWidget {

  List<Widget> _widgetOptions = <Widget>[
    GamesScreen(),
    MoviesScreen(),
    BooksScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            MoviesScreen(),
            GamesScreen(),
            BooksScreen(),
          ],
        ),
        bottomNavigationBar: TabBar(
          unselectedLabelStyle: Tex,
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
}
