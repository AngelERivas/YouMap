// Imports de Flutter
import 'package:flutter/material.dart';

class DataShow extends StatefulWidget {
  final dynamic city;
  final dynamic name;
  final dynamic country;
  final dynamic namecamp;

  const DataShow({
    super.key,
    required this.city,
    required this.name,
    required this.country,
    required this.namecamp,
  });

  @override
  State<DataShow> createState() => DataShowDesign();
}

class DataShowDesign extends State<DataShow> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.3,
        horizontal: MediaQuery.of(context).size.width * 0.1,
      ),
      shadowColor: const Color.fromRGBO(0, 0, 0, 1),
      alignment: Alignment.center,
      title: Text(
        "Marcador",
        style: TextStyle(
          color: const Color.fromRGBO(137, 171, 180, 1),
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.height * 0.04,
        ),
      ),
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nombre: ",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: const Color.fromRGBO(137, 171, 180, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
              Expanded(
                child: Text(
                  widget.name,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: const Color.fromRGBO(137, 171, 180, 1),
                    fontWeight: FontWeight.normal,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "País: ",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: const Color.fromRGBO(137, 171, 180, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
              Expanded(
                child: Text(
                  widget.country,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: const Color.fromRGBO(137, 171, 180, 1),
                    fontWeight: FontWeight.normal,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.namecamp + ": ",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: const Color.fromRGBO(137, 171, 180, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
              Expanded(
                child: Text(
                  widget.city,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: const Color.fromRGBO(137, 171, 180, 1),
                    fontWeight: FontWeight.normal,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "Ok",
            style: TextStyle(
              color: Color.fromRGBO(137, 171, 180, 1),
            ),
          ),
        ),
      ],
    );
  }
}
