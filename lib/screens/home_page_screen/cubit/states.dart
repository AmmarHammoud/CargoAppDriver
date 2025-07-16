abstract class HomePageScreenStates {}

class HomePageScreenInitialState extends HomePageScreenStates {}

class HomePageScreenLoadingState extends HomePageScreenStates {}

class HomePageScreenSuccessState extends HomePageScreenStates {}

class HomePageScreenErrorState extends HomePageScreenStates {
  final String error;

  HomePageScreenErrorState(this.error);
}
