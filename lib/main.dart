import 'package:cargo_app_driver/screens/home_page_screen/home_page_screen.dart';
import 'package:cargo_app_driver/screens/login_screen/login_screen.dart';
import 'package:cargo_app_driver/screens/order_details_screen/order_details_screen.dart';
import 'package:cargo_app_driver/screens/order_map_screen/order_map_screen.dart';
import 'package:cargo_app_driver/shared/constants/app_routes.dart';
import 'package:cargo_app_driver/shared/constants/constants.dart';
import 'package:cargo_app_driver/shared/storage/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'shared/dio_helper/dio_helper.dart';

void main() async {
  DioHelper.init();
  await StorageHelper.init();
  print(StorageHelper.getUserToken());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.initialRoute,
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
        fontFamily: 'tajawal',
        primaryColor: Constants.primaryColor,
        // scaffoldBackgroundColor: Colors.white70,
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          bodyMedium: TextStyle(
            fontSize: 14,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
          ),
        ),
      ),
      // home: HomePageScreen(),
    );
  }
}
