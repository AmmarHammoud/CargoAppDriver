import 'package:cargo_app_driver/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class OrderComponentButton extends StatelessWidget {
  const OrderComponentButton({
    super.key,
    required this.title,
    required this.titleColor,
    required this.backgroundColor,
  });

  final String title;
  final Color titleColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        side: backgroundColor != Constants.primaryColor
            ? BorderSide(color: Color(0xFFEA5455))
            : null,
      ),
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(
          color: titleColor,
        ),
      ),
    );
  }
}
