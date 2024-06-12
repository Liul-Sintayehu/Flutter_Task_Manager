import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
 
  MyTextField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(255, 219, 214, 214),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
      ),
    );
  }
}
