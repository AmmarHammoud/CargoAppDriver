import 'package:cargo_app_driver/screens/order_details_screen/order_details_address.dart';
import 'package:cargo_app_driver/screens/order_details_screen/order_details_info.dart';
import 'package:cargo_app_driver/screens/order_details_screen/order_details_payment_method.dart';
import 'package:cargo_app_driver/screens/order_details_screen/order_details_receiver_info.dart';
import 'package:cargo_app_driver/shared/component/order_components/order_component_button.dart';
import 'package:cargo_app_driver/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: Text(
          'تفاصيل الطلب',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 1.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: const Color(0xFFCFCFCF))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('12550'),
                            Text('رقم الطلب'),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: Color(0xFFFFF3EA),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Text(
                                  'في الانتظار',
                                  style: TextStyle(
                                    color: const Color(0xFFFF9900),
                                  ),
                                ),
                              ),
                            ),
                            Text('حالة الطلب'),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('17/9/2023'),
                            Text('تاريخ الطلب'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                OrderDetailsInfo(),
                OrderDetailsPaymentMethod(),
                OrderDetailsAddress(),
                OrderDetailsReceiverInfo(),
                OrderComponentButton(
                  title: 'قبول',
                  titleColor: Colors.white,
                  backgroundColor: Constants.primaryColor,
                ),
                OrderComponentButton(
                  title: 'رفض',
                  titleColor: Constants.rejectColor,
                  backgroundColor: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
