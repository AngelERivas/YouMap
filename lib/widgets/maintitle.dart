// Imports de Flutter y Extensiones
import 'package:flutter/material.dart';

class MainTitle extends StatefulWidget {
  // Variables
  final dynamic title;

  const MainTitle({
    super.key,
    required this.title,
  });

  @override
  State<MainTitle> createState() => MainTitleDesign();
}

class MainTitleDesign extends State<MainTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: TextStyle(
                color: const Color.fromRGBO(137, 171, 180, 1),
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.05,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
