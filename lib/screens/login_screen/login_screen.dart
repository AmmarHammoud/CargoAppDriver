import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/component/customized_botton.dart';
import '../../shared/component/validated_text_field.dart';
import '../../shared/constants/constants.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginScreenCubit(),
      child: BlocConsumer<LoginScreenCubit, LoginScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var loginCubitObject = LoginScreenCubit.get(context);
          var screenHeight = MediaQuery.of(context).size.height;
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Constants.primaryColor,
                  height: screenHeight * 0.3,
                  width: double.infinity,
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: SizedBox()),
                        Text(
                          'Go ahead and set up\nyour account',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          'Sign in-up enjoy the best experience',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  transform: Matrix4.translationValues(0.0, -25.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        ValidatedTextField(
                          icon: Icons.phone,
                          controller: loginCubitObject
                              .userTextController.phonController,
                          validator: loginCubitObject
                              .userTextValidators.phoneValidator,
                          errorText: 'phone field cannot be empty',
                          hintText: 'phone',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ValidatedTextField(
                          icon: Icons.lock,
                          obscureText: true,
                          controller: loginCubitObject
                              .userTextController.passwordController,
                          validator: loginCubitObject
                              .userTextValidators.passwordValidator,
                          errorText: 'password field cannot be empty',
                          hintText: 'password',
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(value: false, onChanged: (d) {}),
                            TextButton(
                                onPressed: () {},
                                child: Text('Forget Password?'))
                          ],
                        ),
                        CustomizedButton(
                            title: 'Login',
                            condition: state is! LoginScreenLoadingState,
                            onPressed: () {
                              loginCubitObject.Login();
                            }),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: const [
                            Expanded(child: Divider()),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text('Or login with'),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
