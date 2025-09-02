import 'package:cargo_app_driver/shared/component/app_bar_icon_component.dart';
import 'package:cargo_app_driver/shared/component/map_widget/mark_destination.dart';
import 'package:cargo_app_driver/shared/constants/shipment_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../../../models/shipment_model.dart';
import '../../constants/constants.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    super.key,
    required this.shipmentModel,
  });

  final ShipmentModel shipmentModel;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Constants.primaryColor,
            ),
            height: screenHeight * 0.14,
            width: double.infinity,
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppBarIconComponent(
                      icon: Icons.arrow_back,
                      onTap: Get.back,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                onTap: (tapPos, latLng) {
                  print(tapPos);
                  print(latLng);
                },
                initialCenter: LatLng(33.510414, 36.278336),
                initialZoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  // + many other options
                ),
                if (shipmentModel.status == ShipmentStatus.offeredPickupDriver)
                  markDestination(
                    destination: LatLng(
                      double.parse(shipmentModel.sender!.lat!),
                      double.parse(shipmentModel.sender!.lng!),
                    ),
                  ),
                if(shipmentModel.status == ShipmentStatus.offeredDeliveryDriver)
                  markDestination(destination: LatLng(
                    double.parse(shipmentModel.recipient!.lat!),
                    double.parse(shipmentModel.recipient!.lng!),
                  ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
