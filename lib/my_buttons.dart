import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  Buttons({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: Theme.of(context).primaryColor,
        child: Text(text),
        onPressed: onPressed);
  }
}
