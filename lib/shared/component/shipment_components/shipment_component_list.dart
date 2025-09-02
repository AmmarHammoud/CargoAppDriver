import 'package:flutter/material.dart';
import '../../../models/shipment_model.dart';
import 'shipment_component.dart';

class ShipmentComponentList extends StatelessWidget {
  const ShipmentComponentList({
    super.key,
    required this.shipments,
  });

  final List<ShipmentModel> shipments;

  @override
  Widget build(BuildContext context) {
    if (shipments.isEmpty) return const Text('there is no shipments');
    return SizedBox(
      height: MediaQuery.of(context).size.height * .45,
      child: ListView.separated(
        itemBuilder: (context, idx) =>
            ShipmentComponent(shipmentModel: shipments[idx]),
        separatorBuilder: (context, idx) => const SizedBox(
          height: 5,
        ),
        itemCount: shipments.length,
      ),
    );
  }
}
