import 'package:cargo_app_driver/shared/component/order_components/order_component_button.dart';
import 'package:cargo_app_driver/shared/component/order_components/order_component_payment.dart';
import 'package:cargo_app_driver/shared/component/order_pipeline/order_pipeline.dart';
import 'package:cargo_app_driver/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderComponent extends StatelessWidget {
  const OrderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
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
                Text('12550'),
                Text('order num'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('cost'),
                      SizedBox(
                        height: screenHeight * 0.08,
                      ),
                      OrderComponentPayment(title: 'cash'),
                    ],
                  ),
                ),
                OrderPipeline(
                  isHorizontal: false,
                  stepRadius: 10.0,
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
                  child: OrderComponentButton(
                    title: 'Reject',
                    titleColor: Constants.rejectColor,
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: OrderComponentButton(
                    title: 'Accept',
                    titleColor: Colors.white,
                    backgroundColor: Constants.primaryColor,
                  ),
                ),
              ],
            ),
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
              )),
            )
          ],
        ),
      ),
    );
  }
}
