import 'package:cargo_app_driver/screens/home_page_screen/current_shipment_widget/current_shipment_widget.dart';
import 'package:flutter/material.dart';
import '../../../models/shipment_model.dart';


class CurrentShipmentList extends StatelessWidget {
  const CurrentShipmentList({
    super.key,
    required this.shipments,
  });

  final List<ShipmentModel> shipments;

  @override
  Widget build(BuildContext context) {
    if (shipments.isEmpty) return const Text('there is no shipments');
    return SizedBox(
      height: MediaQuery.of(context).size.height * .37,
      child: ListView.separated(
        itemBuilder: (context, idx) =>
            CurrentShipmentWidget(shipmentModel: shipments[idx]),
        separatorBuilder: (context, idx) => const SizedBox(
          height: 5,
        ),
        itemCount: shipments.length,
      ),
    );
  }
}
