import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentsapp/core/firebase_auth/firebase_auth_services.dart';
import 'package:studentsapp/presentation/screens/signIn/sign_in_ui.dart';
import 'package:studentsapp/presentation/screens/signIn/sign_up_controller.dart';

//This is the signup page in the app
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Register FirebaseAuthService if not already registered
    if (!Get.isRegistered<FirebaseAuthService>()) {
      Get.put(FirebaseAuthService());
    }

    // Create an instance of SignUpController
    final SignUpController signUpController = Get.put(SignUpController());

    return SignUpUI(
      usernameController: signUpController.usernameController,
      emailController: signUpController.emailController,
      passwordController: signUpController.passwordController,
      onSignUpPressed: signUpController.signUp,
    );
  }
}
