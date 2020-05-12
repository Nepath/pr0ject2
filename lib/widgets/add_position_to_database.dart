import 'package:flutter/material.dart';

class AddPositionToDatabase extends StatefulWidget {

  String appBarTitle;
  Color appBarColor;

  AddPositionToDatabase({this.appBarTitle, this.appBarColor});

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

        ),
      ),
    );
  }
}
