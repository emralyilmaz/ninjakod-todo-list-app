import 'package:flutter/material.dart';
import 'package:todo_list_app/screen.dart/todo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: ToDoScreen(),
    );
  }
}
