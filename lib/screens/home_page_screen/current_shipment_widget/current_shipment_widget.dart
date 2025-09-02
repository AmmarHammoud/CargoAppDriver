import 'package:cargo_app_driver/models/shipment_model.dart';
import 'package:cargo_app_driver/shared/component/order_pipeline/order_pipeline.dart';
import 'package:cargo_app_driver/shared/component/order_pipeline/order_pipeline_steps.dart';
import 'package:cargo_app_driver/shared/constants/app_routes.dart';
import 'package:cargo_app_driver/shared/constants/constants.dart';
import 'package:cargo_app_driver/shared/storage/storage_helper.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/component/shipment_components/shipment_component_payment.dart';

class CurrentShipmentWidget extends StatelessWidget {
  const CurrentShipmentWidget({
    super.key,
    required this.shipmentModel,
  });

  final ShipmentModel shipmentModel;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 1.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(shipmentModel.invoiceNumber!),
                Text('current order'),
              ],
            ),
            OrderPipeline(
              senderName: StorageHelper.getUser().userName,
              receiverName: shipmentModel.recipient!.userName,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShipmentComponentPayment(title: 'paid with visa'),
                Text('purchase'),
              ],
            ),
            SizedBox(
              width: 175,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF65253E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  Get.toNamed(AppRoutes.mapWidget, arguments: shipmentModel);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'show on map',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.map_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
