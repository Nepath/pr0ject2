import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pr0ject2/blocs/fb_database_bloc.dart';
import 'package:pr0ject2/enum/record_type.dart';
import 'package:pr0ject2/model/Library.dart';
import 'package:pr0ject2/model/book.dart';
import 'package:pr0ject2/model/game.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:uuid/uuid.dart';

class AddPositionToDatabase extends StatefulWidget {

  String appBarTitle;
  Color appBarColor;
  RecordType type;
  String authorOrProducer;

  Library library;

  AddPositionToDatabase(RecordType type, {this.library}){
    this.type=type;
    if(type == RecordType.BOOKADD){
      appBarColor= Colors.greenAccent;
      appBarTitle= "Dodaj Książkę";
      authorOrProducer= "Autor";
    }
    else if(type == RecordType.BOOKEDIT){
      appBarColor= Colors.greenAccent;
      appBarTitle= "Edytuj Książkę";
      authorOrProducer="Autor";
    }
    else if(type == RecordType.GAMEADD){
      appBarColor= Colors.orangeAccent;
      appBarTitle= "Dodaj Grę";
      authorOrProducer="Producent";
    }
    else if(type == RecordType.GAMEEDIT){
      appBarColor= Colors.orangeAccent;
      appBarTitle= "Edytuj Grę";
      authorOrProducer="Producent";
    }
  }

  @override
  _AddPositionToDatabaseState createState() => _AddPositionToDatabaseState();
}

class _AddPositionToDatabaseState extends State<AddPositionToDatabase> {

  ProgressDialog progressDialog;

  bool played = false;
  String doneType = "Zakończone";

  DatabaseBloc _databaseBloc;

  TextEditingController editDateText = TextEditingController();
  TextEditingController editTitleText = TextEditingController();
  TextEditingController editCreatorText = TextEditingController();

  StreamSubscription _loading;

  DateTime _date = DateTime.now();
  Future<Null> selectDate (BuildContext context) async{
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        builder: (context,Widget child) => Theme(
          data: Theme.of(context).copyWith(
            accentColor: widget.appBarColor
          ),
          child: child,
        ),
        firstDate: DateTime(1970),
        lastDate: DateTime(2100),
    );

    if(picked!=null && picked!=_date){
      setState(() {
        _date = picked;
        editDateText.text = "${_date.day}.${_date.month}.${_date.year}";
      });
    }
  }

  @override
  void initState() {

    _databaseBloc= BlocProvider.getBloc();
    _loading = _databaseBloc.changesInDatabaseObservable.listen(loadingScreen);
    if(widget.library!=null){
      setState(() {
        doneType;
      });
      if(widget.library.book!=null){
        editTitleText.text = widget.library.book.title;
        editCreatorText.text= widget.library.book.author;
        editDateText.text= widget.library.book.year;
        played = widget.library.book.read;
        doneType="Przeczytane";
      }
      else if(widget.library.game!=null){
        editTitleText.text = widget.library.game.title;
        editCreatorText.text= widget.library.game.producer;
        editDateText.text= widget.library.game.year;
        played = widget.library.game.played;
        doneType="Przeszednięte";
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    _loading.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    progressDialog = ProgressDialog(context, type: ProgressDialogType.Normal);
    progressDialog.style(
        message: "Ładowanie..."
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: widget.appBarColor,
        title: Text("${widget.appBarTitle}"),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 15),
              child: actionIcon())
        ],
      ),
      body: Container(
        child: Theme(
          data: Theme.of(context).copyWith(accentColor: widget.appBarColor, textSelectionColor: widget.appBarColor,  cursorColor: widget.appBarColor, primaryColor: widget.appBarColor   ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Form(
                  child: TextFormField(
                    controller: editTitleText,
                    cursorColor: widget.appBarColor,
                    style: TextStyle(fontSize: 17),
                    decoration: InputDecoration(
                      hoverColor: widget.appBarColor,
                      focusColor: widget.appBarColor,
                      fillColor: widget.appBarColor,
                      contentPadding: EdgeInsets.only(left: 10, right: 10),
                      labelText: "Tytuł",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Form(
                  child: TextFormField(
                    controller: editCreatorText,
                    style: TextStyle(fontSize: 17 ),
                    decoration: InputDecoration(
                        hoverColor: widget.appBarColor,
                        focusColor: widget.appBarColor,
                        fillColor: widget.appBarColor,
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        labelText: "${widget.authorOrProducer}",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: widget.appBarColor,)
                        ),
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
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Form(
                        child: TextFormField(
                          enabled: false,
                          controller: editDateText,
                          cursorColor: widget.appBarColor,
                          style: TextStyle(fontSize: 17 ),
                          decoration: InputDecoration(
                              hoverColor: widget.appBarColor,
                              focusColor: widget.appBarColor,
                              fillColor: widget.appBarColor,
                              contentPadding: EdgeInsets.only(left: 10, right: 10),
                              labelText: "Data wydania",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: widget.appBarColor,)
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide()
                              )
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: InkWell(
                          onTap: (){selectDate(context);},
                          child: Container(
                            height: 50,
                            width: 80,
                            child: Center(
                                child: Icon(Icons.date_range)),
                          ) ,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(3),
                child: Row(
                  children: <Widget>[
                    Expanded(flex: 4 ,child: SizedBox()),
                    Expanded(flex: 2,child: Text("$doneType")),
                    Expanded(
                      flex: 2,
                      child: Checkbox(
                        activeColor: widget.appBarColor,
                        onChanged: ((bool value) {
                          setState(() {
                            played = value;
                          });
                        }),
                        value: played,
                      ),
                    )
                  ],
                )
              ),
              SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {Navigator.of(context).pop(true);},
                        child: Container(
                          height: 50,
                          width: 80,
                          child: Center(child:
                          Text("Cofnij")),
                          decoration: BoxDecoration(
                          border: Border.all(color: Colors.black,width: 2),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {addOrEditRecord();},
                        child: Container(
                          height: 50,
                          width: 100,
                          child: Center(child:
                          Text("Dodaj")),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black,width: 2),
                            color: widget.appBarColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void loadingScreen(bool b){
    if(b){
      Navigator.of(context).pop();
    }
  }

  void addOrEditRecord() {
    if(editCreatorText.text.isEmpty || editCreatorText.text.isEmpty || editDateText.text.isEmpty ){
      Fluttertoast.showToast(
        msg: "Niektóre pola są puste... Uzupełnij",
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
      );
    }
    else{
      print("");
      if(widget.type== RecordType.BOOKADD){
        Library library;
        final uuid = Uuid();
        Book book = Book(id: uuid.v4(), title: editTitleText.text, year: editDateText.text, read: played, author: editCreatorText.text);
        library = Library(book: book);
        _databaseBloc.addItemToFireBaseDatabase(library);
      }
      else if (widget.type == RecordType.BOOKEDIT){
        Library library;
        Book book = widget.library.book;
        book.read= played;
        book.author = editCreatorText.text;
        book.title = editTitleText.text;
        book.year = editDateText.text;
        library = Library(book: book);
        _databaseBloc.addItemToFireBaseDatabase(library);
      }
      else if (widget.type == RecordType.GAMEEDIT){
        Library library;
        Game game = widget.library.game;
        game.played= played;
        game.producer = editCreatorText.text;
        game.title = editTitleText.text;
        game.year = editDateText.text;
        library = Library(game: game);
        _databaseBloc.addItemToFireBaseDatabase(library);
      }
      else if (widget.type == RecordType.GAMEADD){
        Library library;
        final uuid = Uuid();
        Game game = Game(id: uuid.v4(), title: editTitleText.text, year: editDateText.text, played: played, producer: editCreatorText.text);
        library = Library(game: game);
        _databaseBloc.addItemToFireBaseDatabase(library);
      }
    }
  }

  void deletePosition(){
    _databaseBloc.removeItemFromFireBaseDatabase(widget.library);
  }

  Container actionIcon(){
    if(widget.type == RecordType.BOOKEDIT || widget.type == RecordType.GAMEEDIT){
      return Container(
        child: InkWell(
          onTap: (){deletePosition();},
          child: Icon(Icons.delete),
        ),
      );
    }
    else{
      return Container();
    }
  }
}
