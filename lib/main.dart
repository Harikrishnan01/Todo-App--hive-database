import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_project/home_page.dart';
import 'package:todo_project/screen_todolist.dart';

void main(List<String> args) async {
//initialise Hive
  await Hive.initFlutter();
//open a box
  var box = await Hive.openBox('mybox');
  runApp(Hari());
}

class Hari extends StatelessWidget {
  const Hari({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: HomePage(),
    );
  }
}
