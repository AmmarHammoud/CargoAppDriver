import 'package:bloc/bloc.dart';
import 'package:cargo_app_driver/screens/home_page_screen/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageScreenCubit extends Cubit<HomePageScreenStates> {
  HomePageScreenCubit() : super(HomePageScreenInitialState());

  static HomePageScreenCubit get(context) => BlocProvider.of(context);


}
