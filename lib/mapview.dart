// Imports de Flutter y Extensiones
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Imports de Designs Hechos por Mi
import 'package:youmap/widgets/bar.dart';
import 'package:youmap/widgets/datashow.dart';

// Imports de Vistas
import 'package:youmap/main.dart';

class MapView extends StatefulWidget {
  // Variables
  final dynamic name;
  final double longitude;
  final double latitude;

  const MapView({
    super.key,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<MapView> createState() => MapViewDesign();
}

class MapViewDesign extends State<MapView> {
  // Variables
  String? city;
  String? country;

  // Métodos
  @override
  void initState() {
    super.initState();
    getMarkerData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getMarkerData() async {
    final url =
        'https://nominatim.openstreetmap.org/reverse?format=json&lat=${widget.latitude}&lon=${widget.longitude}';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        city = jsonData['address']['city'];
        country = jsonData['address']['country'];
      });
    } else {
      throw Exception("Error Encontrando la Ubicación");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bar(
        title: "Location",
        barIcon: FontAwesomeIcons.chevronLeft,
        method: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const YouForm(),
            ),
          );
        },
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(widget.latitude, widget.longitude),
          initialZoom: 10,
          interactionOptions:
              const InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom),
        ),
        children: [
          openStreetMapTileLater,
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(widget.latitude, widget.longitude),
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.1,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DataShow(
                                  city: city,
                                  name: widget.name,
                                  country: country);
                            });
                      },
                      child: const Icon(
                        FontAwesomeIcons.locationDot,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

TileLayer get openStreetMapTileLater => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );


// Angel Rivas