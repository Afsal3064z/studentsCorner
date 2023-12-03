import 'package:flutter/material.dart';
import 'package:studentsapp/presentation/screens/landing/landing_page.dart';
import 'package:studentsapp/presentation/screens/login/login_screen.dart';
import 'package:studentsapp/presentation/widgtes/form_container_widget.dart';

//This is the signup page ui in the app
class SignUpUI extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSignUpPressed;

  const SignUpUI({
    super.key,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    required this.onSignUpPressed,
  });

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
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LogInPage()));
              },
              child: const Text(
                "LogIn",
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
        child: Center(
          child: Column(
            children: [
              FittedBox(
                fit: BoxFit.cover,
                child: Image.asset(
                  "lib/assets/man-developing-website-on-desk.png",
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ),
              const Text(
                "SignUp",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              //form field to get the user name
              FormContainerWidget(
                controller: usernameController,
                isPasswordField: false,
                hintText: 'Enter your name',
              ),
              const SizedBox(
                height: 20,
              ),
              //from field to get the user email
              FormContainerWidget(
                controller: emailController,
                isPasswordField: false,
                hintText: 'Enter your email',
              ),
              const SizedBox(
                height: 20,
              ),
              //form field to get the user password
              FormContainerWidget(
                controller: passwordController,
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
                  onPressed: onSignUpPressed,
                  child: const Text(
                    "SignUp",
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
                  const Text("Have an account ? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => LogInPage()));
                    },
                    child: Text(
                      "LogIn",
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
      ),
    );
  }
}
