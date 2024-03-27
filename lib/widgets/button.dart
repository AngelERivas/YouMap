// Imports de Flutter y Extensiones
import 'package:flutter/material.dart';

class FormButton extends StatefulWidget {
  // Variables
  final dynamic buttonIcon;
  final dynamic buttonTitle;
  final dynamic buttonColor;
  final VoidCallback? buttonMethod;

  const FormButton({
    super.key,
    this.buttonMethod,
    required this.buttonIcon,
    required this.buttonTitle,
    required this.buttonColor,
  });

  @override
  State<FormButton> createState() => FormButtonDesign();
}

class FormButtonDesign extends State<FormButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.buttonMethod ?? () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        fixedSize: Size(
          MediaQuery.of(context).size.width * 0.6,
          MediaQuery.of(context).size.height * 0.07,
        ),
        textStyle: TextStyle(
          color: const Color.fromRGBO(255, 255, 255, 1),
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.height * 0.03,
        ),
        backgroundColor: widget.buttonColor,
        elevation: 7,
        shadowColor: const Color.fromRGBO(0, 0, 0, 1),
        side: null,
        shape: const StadiumBorder(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.buttonTitle + "  ",
            style: const TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
          Icon(
            widget.buttonIcon,
            color: const Color.fromRGBO(255, 255, 255, 1),
            size: MediaQuery.of(context).size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
