import 'package:flutter/material.dart';

class AppBarIconComponent extends StatelessWidget {
  const AppBarIconComponent({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Colors.white,
      size: 25,
    );
  }
}
