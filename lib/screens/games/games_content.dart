import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pr0ject2/blocs/fb_database_bloc.dart';
import 'package:pr0ject2/model/Library.dart';
import 'package:pr0ject2/screens/games/content/game_item.dart';

class GamesContent extends StatefulWidget {
  @override
  _GamesContentState createState() => _GamesContentState();
}

class _GamesContentState extends State<GamesContent> {

  List<Library> listofGames = [];
  DatabaseBloc _databaseBloc;

  @override
  void initState() {
    _databaseBloc = BlocProvider.getBloc();
    _databaseBloc.deletedGameIdObservable.listen(onDeleteItem);
    _databaseBloc.onGameCAdded.listen(onGameAdded);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
            child: ListView.builder(
              itemCount: listofGames.length,
              itemBuilder: (_, position) { return new GameItem(listofGames[position]);},
            )
        )
    );
  }

  void onGameAdded(Library library){
    setState(() {
      listofGames.add(library);
    });
  }

  void onDeleteItem(Library library){
    setState(() {
      listofGames.removeWhere((item) => item.getItemId() == library.getItemId());
    });
  }

}
