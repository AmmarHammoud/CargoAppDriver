import 'package:cargo_app_driver/shared/storage/storage_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user_model.dart';
import '../../../shared/constants/user_text_controllers.dart';
import '../../../shared/constants/user_text_validators.dart';
import '../../../shared/dio_helper/dio_helper.dart';
import 'states.dart';

class LoginScreenCubit extends Cubit<LoginScreenStates> {
  LoginScreenCubit() : super(LoginScreenInitialState());

  static LoginScreenCubit get(context) => BlocProvider.of(context);

  UserTextController userTextController = UserTextController();
  UserTextValidators userTextValidators = UserTextValidators();
  late UserModel userModel;

  login() async {
    var validated =
        userTextValidators.emailValidator.currentState!.validate() &&
            userTextValidators.passwordValidator.currentState!.validate();

    if (!validated) return;

    emit(LoginScreenLoadingState());

    try {
      var loginResponse = await DioHelper.login(
        password: userTextController.passwordController.text,
        email: userTextController.emailController.text,
      );
      print(loginResponse.data['data']);
      if (loginResponse.statusCode == 200) {
        userModel = UserModel.fromJson(loginResponse.data['data']);
        print('user model decoded: ${userModel.toString()}');
        await StorageHelper.storeUser(userModel);
        print('user token after login: ${StorageHelper.getUserToken()}');
        emit(LoginScreenSuccessState(loginResponse.data['message']));
      } else {
        emit(LoginScreenErrorState(loginResponse.data['message']));
      }
    } catch (e, h) {
      print(e.toString());
      print(h.toString());
      emit(LoginScreenErrorState(e.toString()));
    }
  }
}
