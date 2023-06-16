import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todo_List = [];
  //reference my box
  final _myBox = Hive.box('mybox');
//this is the first time ever opening this app
  void createInitialData() {
    todo_List = [
      ["Make a tutorial", false],
      ["Eat breakfast", false]
    ];
  }

  //load the data from database
  void loadData() {
    todo_List = _myBox.get('TODOLIST');
  }

  //update the database
  void updateData() {
    _myBox.put("TODOLIST", todo_List);
  }
}
