abstract class HomePageScreenStates {}

class HomePageScreenInitialState extends HomePageScreenStates {}

class HomePageScreenLoadingState extends HomePageScreenStates {}

class HomePageScreenSuccessState extends HomePageScreenStates {}

class HomePageScreenErrorState extends HomePageScreenStates {
  final String error;

  HomePageScreenErrorState(this.error);
}

class HomePageScreenAcceptingOrRejectingShipment extends HomePageScreenStates {}

class HomePageScreenShipmentAccepted extends HomePageScreenStates {
  final String invoiceNumber;

  HomePageScreenShipmentAccepted(this.invoiceNumber);
}

class HomePageScreenShipmentRejected extends HomePageScreenStates {
  final String invoiceNumber;

  HomePageScreenShipmentRejected(this.invoiceNumber);
}
