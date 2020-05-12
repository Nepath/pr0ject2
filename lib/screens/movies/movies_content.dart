import 'package:flutter/material.dart';
import 'package:pr0ject2/screens/movies/content/movie_item.dart';

class MoviesContent extends StatefulWidget {
  @override
  _MoviesContentState createState() => _MoviesContentState();
}

class _MoviesContentState extends State<MoviesContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              MovieItem()
            ],
          ),
        )
    );
  }
}
