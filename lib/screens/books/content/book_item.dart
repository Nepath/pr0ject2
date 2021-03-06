import 'package:flutter/material.dart';
import 'package:pr0ject2/enum/record_type.dart';
import 'package:pr0ject2/model/Library.dart';
import 'package:pr0ject2/widgets/add_position_to_database.dart';

class BookItem extends StatefulWidget {

  Library book;

  BookItem(this.book);

  @override
  _BookItemState createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {

  Library book;

  @override
  void initState() {
    book = widget.book;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff2e2e2e),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.greenAccent),
          boxShadow: [
            BoxShadow(
              color: Colors.greenAccent[100],
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(Icons.book , size: 50,),
          title: Text("Tytuł: ${book.book.title}", style: TextStyle(fontSize: 20,),),
          subtitle: Text("Autor: ${book.book.author} \nRok wydania: ${book.book.year}"),
          trailing: InkWell(
            onTap: (){Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddPositionToDatabase(RecordType.BOOKEDIT, library: book,), ));},
              child: Icon(Icons.edit)),
          isThreeLine: true,
        ),
      ),
    );
  }
}
