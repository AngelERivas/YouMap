// Imports de Flutter y Extensiones
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Imports de Designs Hechos por Mi
import 'package:youmap/widgets/bar.dart';
import 'package:youmap/widgets/button.dart';
import 'package:youmap/widgets/maintitle.dart';
import 'package:youmap/widgets/textfield.dart';

// Imports de Vistas
import 'package:youmap/mapview.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        home: const YouForm(),
      ),
    );

// YouMap Form
class YouForm extends StatefulWidget {
  const YouForm({super.key});

  @override
  State<YouForm> createState() => YouFormDesign();
}

// YouMap Design
class YouFormDesign extends State<YouForm> {
  // Variables
  TextEditingController nameController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();

  // Métodos
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bar(
        title: "YouMap",
        barIcon: FontAwesomeIcons.bars,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const MainTitle(
              title: "YouMap Form",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ),
              child: Field(
                mode: TextInputType.text,
                title: "Nombre y Apellido",
                fieldIcon: FontAwesomeIcons.solidUser,
                maxLength: 30,
                description: "Primer Nombre y Apellido",
                formController: nameController,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ),
              child: Field(
                mode: TextInputType.number,
                title: "Latitud",
                fieldIcon: FontAwesomeIcons.locationCrosshairs,
                description: "Coordenadas en X",
                formController: latitudeController,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ),
              child: Field(
                mode: TextInputType.number,
                title: "Longitud",
                fieldIcon: FontAwesomeIcons.locationCrosshairs,
                description: "Coordenada en Y",
                formController: longitudeController,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            FormButton(
              buttonIcon: FontAwesomeIcons.magnifyingGlassLocation,
              buttonTitle: "Buscar",
              buttonColor: const Color.fromRGBO(137, 171, 180, 1),
              buttonMethod: () {
                log("Nombre: ${nameController.text}");
                log("Latitud: ${latitudeController.text}");
                log("Longitud: ${longitudeController.text}");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapView(
                      name: nameController.text,
                      latitude: double.parse(latitudeController.text),
                      longitude: double.parse(longitudeController.text),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Angel Rivas