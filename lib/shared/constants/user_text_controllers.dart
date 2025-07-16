import 'package:flutter/cupertino.dart';

class UserTextController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phonController;



  UserTextController(){
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phonController = TextEditingController();
  }


  dispose(){
    emailController.dispose();
    phonController.dispose();
    passwordController.dispose();
  }

}

