import 'package:flutter/material.dart';

class AddPositionToDatabase extends StatefulWidget {

  String appBarTitle;
  Color appBarColor;
  String authorOrProducer;
  AddPositionToDatabase({this.appBarTitle, this.appBarColor, this.authorOrProducer});

  @override
  _AddPositionToDatabaseState createState() => _AddPositionToDatabaseState();
}

class _AddPositionToDatabaseState extends State<AddPositionToDatabase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.appBarColor,
        title: Text("${widget.appBarTitle}"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Form(
                child: TextFormField(
                  style: TextStyle(fontSize: 17 ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    labelText: "Tytuł",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide()
                    )
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Form(
                child: TextFormField(
                  style: TextStyle(fontSize: 17 ),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10, right: 10),
                      labelText: "${widget.authorOrProducer}",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide()
                      )
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Form(
                child: TextFormField(
                  style: TextStyle(fontSize: 17 ),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10, right: 10),
                      labelText: "Rok wydania",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide()
                      )
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
