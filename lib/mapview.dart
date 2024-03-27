// Imports de Flutter y Extensiones
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Imports de Designs Hechos por Mi
import 'package:youmap/widgets/bar.dart';

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
  // Métodos
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
                    const Icon(
                      FontAwesomeIcons.locationDot,
                      color: Color.fromRGBO(0, 0, 0, 1),
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