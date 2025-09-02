import 'package:cargo_app_driver/screens/home_page_screen/home_page_screen.dart';
import 'package:cargo_app_driver/screens/login_screen/login_screen.dart';
import 'package:cargo_app_driver/shared/component/map_widget/map_widget.dart';
import 'package:cargo_app_driver/shared/component/qr_scanner/qr_scanner.dart';
import 'package:cargo_app_driver/shared/storage/storage_helper.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String loginScreen = '/loginScreen';
  static const String homeScreen = '/homeScreen';
  static const String mapWidget = '/mapWidget';

  static final initialRoute =
      StorageHelper.getUserToken() == null ? loginScreen : homeScreen;


  static final routes = [
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: homeScreen, page: () => const HomePageScreen()),
    GetPage(name: mapWidget, page: () => MapWidget(shipmentModel: Get.arguments)),
  ];
}
