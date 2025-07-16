import 'package:flutter/material.dart';

class OrderComponentPayment extends StatelessWidget {
  const OrderComponentPayment({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: Color(0xFFEAFFF3),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(
          title,
          style: TextStyle(color: Color(0xFF28C76F)),
        ),
      ),
    );
  }
}
