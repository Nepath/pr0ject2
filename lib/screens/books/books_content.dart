import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pr0ject2/blocs/fb_database_bloc.dart';
import 'package:pr0ject2/model/Library.dart';
import 'package:pr0ject2/screens/books/content/book_item.dart';

class BooksContent extends StatefulWidget {

  @override
  _BooksContentState createState() => _BooksContentState();
}

class _BooksContentState extends State<BooksContent> {

  List<Library> listofBooks = [];
  DatabaseBloc _databaseBloc;
  StreamSubscription subscriptiononBookAdded;
  StreamSubscription subscriptiononBookDeleted;

  @override
  void initState() {
    _databaseBloc = BlocProvider.getBloc();
    subscriptiononBookDeleted = _databaseBloc.deletedBookIdObservable.listen(onDeleteItem);
    subscriptiononBookAdded = _databaseBloc.onBookAdded.listen(onBookAdded);
    super.initState();
  }
  @override
  void dispose() {
    subscriptiononBookDeleted.cancel();
    subscriptiononBookAdded.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: ListView.builder(
          itemCount: listofBooks.length,
          itemBuilder: (_, position) { return Dismissible(
              direction: DismissDirection.startToEnd,
              key: ObjectKey(listofBooks[position]),
              onDismissed: (direction){
                _databaseBloc.removeItemFromFireBaseDatabase(listofBooks[position]);
                setState(() {
                  listofBooks.removeAt(position);
                });
              },
              child: BookItem(listofBooks[position]));},
        )
      )
    );
  }

  void onBookAdded(Library library){
    setState(() {
      listofBooks.add(library);
    });
  }

  void onDeleteItem(Library library){
    setState(() {
      listofBooks.removeWhere((item) => item.getItemId() == library.getItemId());
    });
  }
}
