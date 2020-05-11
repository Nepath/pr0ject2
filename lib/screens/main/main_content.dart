import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pr0ject2/firebase_manager/FirebaseDatabaseManager.dart';
import 'package:pr0ject2/model/book.dart';
import 'package:pr0ject2/screens/books/books_screen.dart';
import 'package:pr0ject2/screens/games/games_screen.dart';
import 'package:pr0ject2/screens/movies/movies_screen.dart';

class MainContent extends StatefulWidget {
  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> with SingleTickerProviderStateMixin {

  TabController _tabController;



  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3, initialIndex: 0);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBarView(
        controller: _tabController,
        children: <Widget>[
          MoviesScreen(),
          GamesScreen(),
          BooksScreen(),
        ],
      ),
    );
  }
}
