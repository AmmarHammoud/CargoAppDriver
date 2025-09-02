import 'package:cargo_app_driver/models/shipment_model.dart';
import 'package:cargo_app_driver/screens/home_page_screen/current_shipment_widget/cubit/states.dart';
import 'package:cargo_app_driver/shared/dio_helper/dio_helper.dart';
import 'package:cargo_app_driver/shared/storage/storage_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentShipmentWidgetCubit extends Cubit<CurrentShipmentWidgetStates> {
  CurrentShipmentWidgetCubit() : super(CurrentShipmentWidgetInitialState());

  static CurrentShipmentWidgetCubit get(context) => BlocProvider.of(context);

  List<ShipmentModel> currentShipments = [];

  getCurrentShipments() async {
    emit(CurrentShipmentWidgetLoadingState());
    try {
      var response = await DioHelper.getAcceptedShipments(
          token: StorageHelper.getUserToken()!);
      // print(response.data);
      if (response.statusCode == 200) {
        currentShipments.clear();
        for (var shipment in response.data['offers']) {
          currentShipments.add(ShipmentModel.fromJson(shipment['shipment']));
        }
        print(currentShipments);
        emit(CurrentShipmentWidgetSuccessState());
      } else {
        emit(CurrentShipmentWidgetErrorState(
            response.data['message'] ?? 'error'));
      }
    } catch (e, h) {
      print(e.toString());
      print(h.toString());
      emit(CurrentShipmentWidgetErrorState(e.toString()));
    }
  }

  void confirmPickup({required String barcode}) async {
    emit(CurrentShipmentWidgetScanningQrState());
    try {
      var response = await DioHelper.confirmPickup(
          token: StorageHelper.getUserToken()!, barcode: barcode);
      print(response.data);
      if (response.statusCode == 200) {
        emit(CurrentShipmentWidgetScannedQrSuccessState(
            response.data['message']));
      } else {
        emit(
            CurrentShipmentWidgetScannedQrErrorState(response.data['message']));
      }
    } catch (e, h) {
      print(e.toString());
      print(h.toString());
      emit(CurrentShipmentWidgetScannedQrErrorState(e.toString()));
    }
  }
}
