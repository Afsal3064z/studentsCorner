import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentsapp/presentation/screens/landing/landing_page.dart';
import 'package:studentsapp/presentation/screens/login/login_controller.dart';
import 'package:studentsapp/presentation/screens/signIn/singup_page.dart';

import 'package:studentsapp/presentation/widgtes/form_container_widget.dart';

//This is the login page in the app
class LogInPage extends StatelessWidget {
  final LogInController _controller = Get.put(LogInController());

  LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Students Corner",
            style: TextStyle(color: Colors.white),
          ),
        ),
        toolbarHeight: 70,
        backgroundColor: const Color.fromARGB(255, 115, 46, 233),
        elevation: 4.0,
        shadowColor: Colors.grey.shade400,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LandingPage()));
            },
            child: const Icon(
              Icons.school,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
        actions: [
          Container(
            width: 100,
            height: 40,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(23))),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SignUpPage()));
              },
              child: const Text(
                "SignUp",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white24, Color.fromARGB(255, 91, 54, 255)],
          ),
        ),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset(
                      "lib/assets/concept-of-data-analysis-and-maintenance.png",
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.6,
                    ),
                  ),
                  const Text(
                    "Log In",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FormContainerWidget(
                    controller: _controller.emailController,
                    isPasswordField: false,
                    hintText: 'Enter your email',
                  ),
                  const SizedBox(
                    height: 20,
                  ), //This is the form field widget to validate the user login
                  FormContainerWidget(
                    controller: _controller.passwordController,
                    isPasswordField: true,
                    hintText: 'Enter your password',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 115, 46, 233),
                      borderRadius: const BorderRadius.all(Radius.circular(23)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          offset: const Offset(0, 3),
                          blurRadius: 10,
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    width: 100,
                    height: 50,
                    child: TextButton(
                      onPressed: _controller.signIn,
                      child: const Text(
                        "Log In",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account ? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()),
                          );
                        },
                        child: Text(
                          "SignUp",
                          style: TextStyle(
                              color: Colors.deepPurple.shade700,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
