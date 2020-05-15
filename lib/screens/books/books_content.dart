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

  @override
  void initState() {
    _databaseBloc = BlocProvider.getBloc();
    _databaseBloc.onBookAdded.listen(onBookAdded);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: ListView.builder(
          itemCount: listofBooks.length,
          itemBuilder: (_, position) { return new BookItem(listofBooks[position]);},
        )
      )
    );
  }

  void onBookAdded(Library library){
    setState(() {
      listofBooks.add(library);
    });
  }
}
