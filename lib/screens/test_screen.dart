import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pr0ject2/blocs/omdb_bloc.dart';
import 'package:pr0ject2/model/Library.dart';
import 'package:pr0ject2/model/MovieT.dart';

class TestTest extends StatefulWidget {

  String title;
  String imageString = "https://images-na.ssl-images-amazon.com/images/I/81C2seYU41L._SL1500_.jpg";

  MovieT movieT;
  TestTest({this.movieT});
  @override
  _TestTestState createState() => _TestTestState();
}

class _TestTestState extends State<TestTest> {

  OmdbBloc _omdbBloc;
  StreamSubscription result;
  Image image;
  MovieT movie;
  List<String> actors =["trs"];

  @override
  void initState() {
    _omdbBloc = BlocProvider.getBloc();
    movie = widget.movieT;
    image = Image.network(movie.poster);
    result = _omdbBloc.movieStream.listen(fetchData);
    if(movie.poster=="N/A"){
      image=Image.network("https://eticketsolutions.com/demo/themes/e-ticket/img/movie.jpg");
    }
    super.initState();
  }


  void fetchData(MovieT movieResult){
    movie = movieResult;
  }

  
  @override
  void dispose() {
    _omdbBloc.dispose();
    result.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.grey[300] , fontSize: 14),
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Row(
                    children: <Widget>[
                      Text(movie.type),
                      SizedBox(width: 20,),
                      Text(movie.genre),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Text("Data wydania" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text(movie.released),
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(movie.plot),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: image),
                    Expanded(
                      flex: 1,
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.access_time, size: 40,),
                                  SizedBox(width: 10,),
                                  Text(movie.runtime),
                                ],
                              ),
                              SizedBox(height: 30,),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.star, color: Colors.yellowAccent, size: 40,),
                                  SizedBox(width: 10,),
                                  Text(movie.imdbRate),
                                ],
                              ),
                              SizedBox(height: 30,),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.supervised_user_circle, size: 40,),
                                  SizedBox(width: 10,),
                                  Text(movie.imdbVotes),
                                ],
                              ),
                            ],
                          )
                      ),
                    )
                  ],
                ),
                Divider(height: 20, thickness: 2,),
                Padding(
                    padding: EdgeInsets.only(bottom: 20, left: 10),
                    child: Text("Reżyser" , style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), ),),
                Row(
                  children: <Widget>[
                    Icon(Icons.person, size: 16,),
                    SizedBox(width: 10),
                    Text(movie.director, style: TextStyle(fontSize: 16),),
                  ],
                ),
                Divider(height: 20, thickness: 2,),
                Padding(
                  padding: EdgeInsets.only(bottom: 20, left: 10),
                  child: Text("Aktorzy" , style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), ),),
                ListView.builder(
                  shrinkWrap: true,
                    itemCount: movie.actorsList().length,
                    itemBuilder: (_, position) {return Row(
                      children: <Widget>[
                        Icon(Icons.person, size: 16,),
                        SizedBox(width: 10),
                        Text(movie.actorsList()[position], style: TextStyle(fontSize: 16)),
                      ],
                    );})
              ],
            ),
          ),
        ),
      ),
    );
  }
  void testowyvoid(Library lista){
    print(lista.movie.year);
  }
}