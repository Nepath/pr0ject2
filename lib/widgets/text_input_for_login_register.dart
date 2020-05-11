import 'package:flutter/material.dart';


class TextInputLogReg extends StatefulWidget{

  final String hintMessage;

  TextInputLogReg(this.hintMessage);

  @override
  State<StatefulWidget> createState() {
    return TextInputLogRegState();
  }

}

class TextInputLogRegState extends State<TextInputLogReg>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 10, left: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color:  Colors.grey[200])),
      ),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: widget.hintMessage,
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none
        ),
      ),
    );
  }

}