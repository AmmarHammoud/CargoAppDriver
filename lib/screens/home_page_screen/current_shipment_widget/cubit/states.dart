class CurrentShipmentWidgetStates {}

class CurrentShipmentWidgetInitialState extends CurrentShipmentWidgetStates {}

class CurrentShipmentWidgetLoadingState extends CurrentShipmentWidgetStates {}

class CurrentShipmentWidgetSuccessState extends CurrentShipmentWidgetStates {}

class CurrentShipmentWidgetErrorState extends CurrentShipmentWidgetStates {
  final String error;

  CurrentShipmentWidgetErrorState(this.error);
}

class CurrentShipmentWidgetScanningQrState
    extends CurrentShipmentWidgetStates {}

class CurrentShipmentWidgetScannedQrSuccessState
    extends CurrentShipmentWidgetStates {
  final String message;

  CurrentShipmentWidgetScannedQrSuccessState(this.message);
}

class CurrentShipmentWidgetScannedQrErrorState
    extends CurrentShipmentWidgetStates {
  final String error;

  CurrentShipmentWidgetScannedQrErrorState(this.error);
}
