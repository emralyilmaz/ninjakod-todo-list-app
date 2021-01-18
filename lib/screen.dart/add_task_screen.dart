import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(40),
      child: Column(
        children: [
          Text("Add your task"),
          TextField(
            controller: textController,
          ),
          FlatButton(
              child: Text("add"),
              onPressed: () {
                Navigator.pop(context, textController.text);
              })
        ],
      ),
    );
  }
}
