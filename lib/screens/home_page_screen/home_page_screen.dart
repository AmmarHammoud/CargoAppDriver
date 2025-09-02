import 'package:cargo_app_driver/screens/home_page_screen/cubit/cubit.dart';
import 'package:cargo_app_driver/screens/home_page_screen/cubit/states.dart';
import 'package:cargo_app_driver/screens/home_page_screen/current_shipment_widget/cubit/cubit.dart';
import 'package:cargo_app_driver/screens/home_page_screen/current_shipment_widget/cubit/states.dart';
import 'package:cargo_app_driver/screens/home_page_screen/current_shipment_widget/current_shipment_list.dart';
import 'package:cargo_app_driver/shared/component/app_bar_icon_component.dart';
import 'package:cargo_app_driver/shared/component/qr_scanner/qr_scanner.dart';
import 'package:cargo_app_driver/shared/component/show_toast.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/component/shipment_components/shipment_component_list.dart';
import '../../shared/constants/constants.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void _showBottomSheet() {
      bool isDismissed = false;

      showModalBottomSheet<void>(
        context: context,
        isDismissible: true,
        builder: (BuildContext context) {
          return Container(
            height: 500,
            color: Colors.white,
            child: Center(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: QrScanner(
                    onDetect: (result) {
                      if (!isDismissed) {
                        print('xxxx|xxxx|xxxx|xxxx');
                        print(result.barcodes.first.rawValue);
                        Navigator.pop(context);
                        isDismissed = true;
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomePageScreenCubit()..getOffers(),
          ),
          BlocProvider(
            create: (context) =>
                CurrentShipmentWidgetCubit()..getCurrentShipments(),
          ),
        ],
        child: Builder(builder: (context) {
          return RefreshIndicator(
            onRefresh: () async {
              var homeCubit = context.read<HomePageScreenCubit>();
              var currentShipmentCubit =
                  context.read<CurrentShipmentWidgetCubit>();

              await homeCubit.getOffers();
              await currentShipmentCubit.getCurrentShipments();
            },
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Constants.primaryColor,
                  ),
                  height: screenHeight * 0.14,
                  width: double.infinity,
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppBarIconComponent(
                            icon: Icons.qr_code_scanner_rounded,
                            onTap: () {
                              _showBottomSheet();
                            },
                          ),
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
                  // decoration: BoxDecoration(
                  //   color: Color(0xf6f6f6),
                  //   borderRadius: BorderRadius.circular(30),
                  // ),
                  // transform: Matrix4.translationValues(0.0, -25.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        //CurrentOrderWidget(),
                        BlocConsumer<CurrentShipmentWidgetCubit,
                            CurrentShipmentWidgetStates>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            var cubit = CurrentShipmentWidgetCubit.get(context);
                            return ConditionalBuilder(
                              condition:
                                  state is CurrentShipmentWidgetLoadingState,
                              builder: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              fallback: (context) => CurrentShipmentList(
                                  shipments: cubit.currentShipments),
                            );
                          },
                        ),
                        BlocConsumer<HomePageScreenCubit, HomePageScreenStates>(
                          listener: (context, state) {
                            // String message = 'Shipment with invoice num ${state.invoiceNumber}';
                            if (state is HomePageScreenShipmentAccepted) {
                              showToast(
                                  context: context,
                                  text:
                                      'Shipment with invoice num: {} accepted',
                                  color: Constants.primaryColor);
                            }
                            if (state is HomePageScreenShipmentRejected) {
                              showToast(
                                  context: context,
                                  text:
                                      'Shipment with invoice num: {} rejected',
                                  color: Constants.primaryColor);
                            }
                          },
                          builder: (context, state) {
                            var homeCubit = HomePageScreenCubit.get(context);
                            return ConditionalBuilder(
                              condition: state is HomePageScreenLoadingState,
                              builder: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              fallback: (context) => ShipmentComponentList(
                                  shipments: homeCubit.shipments),
                            );
                          },
                        )
                        //OrderComponent(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
