import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_project/data/database.dart';
import 'package:todo_project/dialog_box.dart';
import 'package:todo_project/screen_todolist.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');
  final _textController = TextEditingController();
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    //if this is the first time opening the app then the defaul data should appear
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //there already exists data
      db.loadData();
    }
    super.initState();
  }

  void onChanged(bool? value, int index) {
    setState(() {
      db.todo_List[index][1] = !db.todo_List[index][1];
    });
  }

  void saveTask() {
    setState(() {
      db.todo_List.add([_textController.text, false]);
      _textController.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      db.todo_List.removeAt(index);
    });
    db.updateData();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            textController: _textController,
            Save: saveTask,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.yellow[200],
          appBar: AppBar(
            title: Center(child: Text('TO DO')),
            elevation: 0,
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add), onPressed: createNewTask),
          body: ListView.builder(
              itemCount: db.todo_List.length,
              itemBuilder: (BuildContext context, int index) {
                return ScreenTodoList(
                    onDelete: (context) {
                      deleteTask(index);
                    },
                    taskName: db.todo_List[index][0],
                    taskCompleted: db.todo_List[index][1],
                    onChanged: (value) {
                      onChanged(value, index);
                    });
              })),
    );
  }
}
