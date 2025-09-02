import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class OrderMapScreen extends StatelessWidget {
  const OrderMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(33.510414, 36.278336),
          initialZoom: 10.0,
        ),
        children: [
          // TileLayer(
          //   urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          //   userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          //   // + many other options
          // ),
          TileLayer(
            urlTemplate: 'https://long-term.cache.maps.stamen.com/watercolor/{z}/{x}/{y}.jpg',
            userAgentPackageName: 'com.example.app',
          ),
        ],
      ),
    );
  }
}
