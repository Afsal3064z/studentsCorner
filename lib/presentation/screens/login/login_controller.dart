import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:studentsapp/core/firebase_auth/firebase_auth_services.dart';
import 'package:studentsapp/presentation/screens/home/home_page.dart';

//These are the event / function happening in the login page
class LogInController extends GetxController {
  final FirebaseAuthService authService = FirebaseAuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

//This is the methode to signup the user in the app
  Future<void> signIn() async {
    final String email = emailController.text;
    final String password = passwordController.text;
    final User? user =
        await authService.logInWithEmailAndPassword(email, password);

    if (user != null) {
      // ignore: avoid_print
      print("User is successfully signed in");
      Get.offAll(() =>  HomePage());
    } else {
      // ignore: avoid_print
      print("Some error happened while signing in");
    }
  }
}
