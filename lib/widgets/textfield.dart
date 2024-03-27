// Imports de Flutter y Extensiones
import 'package:flutter/material.dart';

class Field extends StatefulWidget {
  // Variables
  final dynamic mode;
  final dynamic title;
  final dynamic fieldIcon;
  final dynamic maxLength;
  final dynamic description;
  final TextEditingController formController;

  const Field({
    super.key,
    this.maxLength,
    required this.mode,
    required this.title,
    required this.fieldIcon,
    required this.description,
    required this.formController,
  });

  @override
  State<Field> createState() => FieldDesign();
}

class FieldDesign extends State<Field> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.formController,
      cursorColor: const Color.fromRGBO(137, 171, 180, 1),
      maxLength: widget.maxLength,
      keyboardType: widget.mode,
      decoration: InputDecoration(
        icon: Icon(
          widget.fieldIcon,
          color: const Color.fromRGBO(137, 171, 180, 1),
        ),
        labelText: widget.title,
        labelStyle: const TextStyle(
          color: Color.fromRGBO(137, 171, 180, 1),
          fontWeight: FontWeight.bold,
        ),
        helperText: widget.description,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(137, 171, 180, 1),
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(61, 89, 96, 1),
            style: BorderStyle.solid,
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(201, 13, 18, 1),
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
