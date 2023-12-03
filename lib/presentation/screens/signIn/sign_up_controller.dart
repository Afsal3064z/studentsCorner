import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentsapp/core/firebase_auth/firebase_auth_services.dart';
import 'package:studentsapp/presentation/screens/home/home_page.dart';

//These are the events / function in the singup page
class SignUpController extends GetxController {
  final FirebaseAuthService _authService = Get.find<FirebaseAuthService>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get usernameController => _usernameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

//This is the methode to signup the user in the firebase
  Future<void> signUp() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    // Call the signUpWithEmalAndPassword method from the FirebaseAuthService
    User? user = await _authService.signUpWithEmailAndPasswordAndName(
        email, password, username);

    if (user != null) {
      // ignore: avoid_print
      print("User is successfully created");
      // Redirect to home page or any other desired screen
      Get.offAll(() => HomePage());
    } else {
      // ignore: avoid_print
      print("Some error happened");
    }
  }
}
