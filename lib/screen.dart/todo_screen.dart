import 'package:flutter/material.dart';
import 'package:todo_list_app/model/task.dart';
import 'package:todo_list_app/screen.dart/add_task_screen.dart';
import 'package:todo_list_app/widget/task_list_tile_widget.dart';

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  List<Task> taskList = [
    Task(taskName: "Evi boya", isDone: false),
    Task(
      taskName: "Ödevlerini yap.",
      isDone: false,
    ),
    Task(taskName: "Sınava çalış", isDone: false)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List "),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String newTaskName = await showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddTaskScreen();
              });
          setState(() {
            taskList.add(Task(taskName: newTaskName, isDone: false));
          });
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Text("${taskList.length} adet görev vardır."),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.lime),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(10),
              padding:
                  EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 70),
              height: double.minPositive,
              width: 500,
              child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (context, index) {
                    return TaskListTile(
                      item: taskList[index],
                      changeCheckbox: (bool val) {
                        setState(() {
                          taskList[index].isDone = val;
                        });
                      },
                      onDelete: () {
                        setState(() {
                          taskList.removeAt(index);
                        });
                      },
                    );
                  }),
            ),
          )
        ],
      )),
    );
  }
}
