import 'package:cargo_app_driver/screens/login_screen/login_screen.dart';
import 'package:cargo_app_driver/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'shared/dio_helper/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          elevation: 1.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom:
              Radius.circular(20.0), // Apply 30px radius to bottom corners
            ),
          ),
        ),
        fontFamily: 'rubik',
        primaryColor: Constants.primaryColor,
        // scaffoldBackgroundColor: Colors.white70,
        textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(
              fontSize: 14,
            ),
            bodySmall: TextStyle(
              fontSize: 12,
            )),
      ),
      home: LoginScreen(),
    );
  }
}
