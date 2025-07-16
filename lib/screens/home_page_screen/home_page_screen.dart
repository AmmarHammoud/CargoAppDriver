import 'package:cargo_app_driver/screens/home_page_screen/current_order_widget/current_order_widget.dart';
import 'package:cargo_app_driver/shared/component/app_bar_icon_component.dart';
import 'package:cargo_app_driver/shared/component/order_components/order_component.dart';
import 'package:flutter/material.dart';

import '../../shared/constants/constants.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

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
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppBarIconComponent(icon: Icons.qr_code_scanner_rounded),
                    Text(
                      'Home',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    AppBarIconComponent(
                        icon: Icons.notification_important_outlined),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xf6f6f6),
              borderRadius: BorderRadius.circular(30),
            ),
            // transform: Matrix4.translationValues(0.0, -25.0, 0.0),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  CurrentOrderWidget(),
                  SizedBox(width: 20,),
                  OrderComponent(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
