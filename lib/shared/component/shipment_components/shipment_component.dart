import 'package:cargo_app_driver/main.dart';
import 'package:cargo_app_driver/models/shipment_model.dart';
import 'package:cargo_app_driver/screens/home_page_screen/cubit/cubit.dart';
import 'package:cargo_app_driver/shared/component/order_pipeline/order_pipeline.dart';
import 'package:cargo_app_driver/shared/constants/constants.dart';
import 'package:cargo_app_driver/shared/constants/shipment_status.dart';
import 'package:cargo_app_driver/shared/storage/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'shipment_component_button.dart';
import 'shipment_component_payment.dart';

class ShipmentComponent extends StatelessWidget {
  const ShipmentComponent({
    super.key,
    required this.shipmentModel,
  });

  final ShipmentModel shipmentModel;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var cubit = context.read<HomePageScreenCubit>();
    return Card(
      elevation: 1.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Text('12550'),
                Text(shipmentModel.invoiceNumber ?? 'null'),
                Text('رقم الطلب'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('المبلغ'),
                      Text('\$${shipmentModel.totalAmount}'),
                      SizedBox(
                        height: screenHeight * 0.08,
                      ),
                      ShipmentComponentPayment(title: 'cash'),
                    ],
                  ),
                ),
                OrderPipeline(
                  isHorizontal: false,
                  stepRadius: 10.0,
                  senderName: StorageHelper.getUser().userName,
                  receiverName: shipmentModel.recipient!.userName,
                ),
                Image.asset(
                  'assets/images/car.png',
                  scale: 5.0,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ShipmentComponentButton(
                    title: 'Reject',
                    onPressed: () {
                      cubit.rejectShipment(
                        id: shipmentModel.id,
                        invoiceNumber: shipmentModel.invoiceNumber!,
                      );
                      cubit.getOffers();
                    },
                    titleColor: Constants.rejectColor,
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ShipmentComponentButton(
                    title: 'Accept',
                    onPressed: () {
                      cubit.acceptShipment(
                        id: shipmentModel.id,
                        invoiceNumber: shipmentModel.invoiceNumber!,
                      );
                      cubit.getOffers();
                    },
                    titleColor: Colors.white,
                    backgroundColor: Constants.primaryColor,
                  ),
                ),
              ],
            ),
            if (shipmentModel.status == ShipmentStatus.delivered)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color(0xFF27AE61),
                ),
                width: double.infinity,
                height: screenHeight * 0.05,
                child: Center(
                  child: Text(
                    'delivered',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
