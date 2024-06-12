import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  String name;
  bool isClicked;
  Function()? onPressed;
  MyTextButton(
      {required this.onPressed,
      required this.name,
      required this.isClicked,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(name),
      style: TextButton.styleFrom(
          textStyle: TextStyle(color: Colors.white),
          backgroundColor:
              isClicked ? Colors.black : Color.fromARGB(255, 199, 192, 192)),
    );
  }
}
