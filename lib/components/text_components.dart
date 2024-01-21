import 'package:flutter/material.dart';

class CustomizedTextfield extends StatelessWidget {
  final String hinttext;
  final String label;
  final IconData? icon;
  const CustomizedTextfield(
      {super.key, required this.hinttext, required this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 224, 222, 222),
          filled: true,
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          suffix: Icon(icon),
        ),
      ),
    );
  }
}
