import 'package:flutter/material.dart';

class MovieItem extends StatefulWidget {
  @override
  _MovieItemState createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff2e2e2e),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.blueAccent),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent[100],
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(Icons.movie , size: 50,),
          title: Text("Tytuł: Wiedźmin", style: TextStyle(fontSize: 20,),),
          subtitle: Text("Autor: Andrzej Sapkowski \nRok wydania: asgagsg"),
          trailing: Icon(Icons.edit),
          isThreeLine: true,
        ),
      ),
    );
  }
}
