// Imports de Flutter y Extensiones
import 'package:flutter/material.dart';

PreferredSizeWidget bar({barIcon, title, VoidCallback? method}) {
  return AppBar(
    backgroundColor: const Color.fromRGBO(137, 171, 180, 1),
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        barIcon,
        color: const Color.fromRGBO(255, 255, 255, 1),
      ),
      onPressed: method ?? () {},
    ),
    title: Text(
      title,
      style: const TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
