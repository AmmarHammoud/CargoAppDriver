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

  Login() async {
    var validated =
        userTextValidators.phoneValidator.currentState!.validate() &&
            userTextValidators.passwordValidator.currentState!.validate();

    if (!validated) return;

    emit(LoginScreenLoadingState());

    var loginResponse = await DioHelper.login(
      password: userTextController.passwordController.text,
      phone: userTextController.phonController.text,
    );

    if (loginResponse.statusCode == 201) {
      userModel = UserModel.fromJson(loginResponse.data);
      emit(LoginScreenSuccessState());
    } else {
      emit(LoginScreenErrorState("the error message that comes form backend"));
    }
  }
}
