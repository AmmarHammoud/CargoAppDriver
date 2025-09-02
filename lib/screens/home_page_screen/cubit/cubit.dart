import 'package:bloc/bloc.dart';
import 'package:cargo_app_driver/models/shipment_model.dart';
import 'package:cargo_app_driver/screens/home_page_screen/cubit/states.dart';
import 'package:cargo_app_driver/shared/dio_helper/dio_helper.dart';
import 'package:cargo_app_driver/shared/storage/storage_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageScreenCubit extends Cubit<HomePageScreenStates> {
  HomePageScreenCubit() : super(HomePageScreenInitialState());

  static HomePageScreenCubit get(context) => BlocProvider.of(context);

  List<ShipmentModel> shipments = [];

  getOffers() async {
    emit(HomePageScreenLoadingState());
    try {
      var response =
          await DioHelper.getOffers(token: StorageHelper.getUserToken()!);
      print(response.statusCode);
      // print(response.data['offers'][0]);
      if (response.statusCode == 200) {
        shipments.clear();
        for (var shipment in response.data['offers']) {
          shipments.add(ShipmentModel.fromJson(shipment['shipment']));
        }
        print('---');
        // print(shipments[0]);
        emit(HomePageScreenSuccessState());
      } else {
        emit(HomePageScreenErrorState(response.data['message']));
      }
    } catch (e, h) {
      print(e.toString());
      print(h.toString());
      emit(HomePageScreenErrorState(e.toString()));
    }
  }

  _acceptOrRejectShipment({
    required int id,
    required String invoiceNumber,
    required bool isAccepted,
  }) async {
    emit(HomePageScreenAcceptingOrRejectingShipment());
    try {
      var response = await DioHelper.acceptOrRejectShipment(
          id: id, token: StorageHelper.getUserToken()!, isAccepted: isAccepted);
      if (response.statusCode == 200) {
        if (isAccepted) {
          emit(HomePageScreenShipmentAccepted(invoiceNumber));
        } else {
          emit(HomePageScreenShipmentRejected(invoiceNumber));
        }
        emit(HomePageScreenSuccessState());
      } else {
        emit(HomePageScreenErrorState(response.data['message']));
      }
    } catch (e, h) {
      print(e.toString());
      emit(HomePageScreenErrorState(e.toString()));
    }
  }

  acceptShipment({
    required int id,
    required String invoiceNumber,
  }) {
    _acceptOrRejectShipment(
      id: id,
      isAccepted: true,
      invoiceNumber: invoiceNumber,
    );
  }

  rejectShipment({
    required int id,
    required String invoiceNumber,
  }) {
    _acceptOrRejectShipment(
      id: id,
      isAccepted: false,
      invoiceNumber: invoiceNumber,
    );
  }
}
