import 'package:flutter/material.dart';
import 'package:todo_project/my_buttons.dart';

class DialogBox extends StatelessWidget {
  final textController;
  VoidCallback Save;
  DialogBox({super.key, required this.textController, required this.Save});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Add a new task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                //ElevatedButton(onPressed: () {}, child: Text('Save')),
                Buttons(text: "Save", onPressed: Save),
                SizedBox(
                  width: 10,
                ),
                //cancel button
                //ElevatedButton(onPressed: () {}, child: Text('Cancel'))
                Buttons(
                    text: "Cancel",
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
