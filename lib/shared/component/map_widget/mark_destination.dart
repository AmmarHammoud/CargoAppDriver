import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

MarkerLayer markDestination({
  required LatLng destination,
}) {
  return MarkerLayer(
    markers: [
      Marker(
        width: 80.0,
        height: 80.0,
        point: destination,
        child: const Icon(
          Icons.location_pin,
          color: Colors.red,
          size: 40.0,
        ),
      ),
    ],
  );
}
