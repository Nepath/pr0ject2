import 'dart:async';

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
  StreamSubscription streamSubscriptionDelete;
  StreamSubscription streamSubscriptionAdd;

  @override
  void initState() {
    _databaseBloc = BlocProvider.getBloc();
    streamSubscriptionDelete = _databaseBloc.deletedGameIdObservable.listen(onDeleteItem);
    streamSubscriptionAdd = _databaseBloc.onGameCAdded.listen(onGameAdded);
    super.initState();
  }

  @override
  void dispose() {
    streamSubscriptionAdd.cancel();
    streamSubscriptionDelete.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
            child: ListView.builder(
              itemCount: listofGames.length,
              itemBuilder: (_, position) { return Dismissible(
                  direction: DismissDirection.startToEnd,
                  key: ObjectKey(listofGames[position]),
                  onDismissed: (direction){
                    _databaseBloc.removeItemFromFireBaseDatabase(listofGames[position]);
                    setState(() {
                      listofGames.removeAt(position);
                    });
                  },
                  child: GameItem(listofGames[position]));},
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
      listofGames.remove(library);
    });
  }

}
