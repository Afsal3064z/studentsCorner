import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentsapp/presentation/screens/info/info_screen.dart';
import 'package:studentsapp/presentation/screens/login/login_screen.dart';
import 'package:studentsapp/presentation/screens/signIn/singup_page.dart';

//This is the landing page in the app
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color.fromARGB(255, 115, 46, 233),
        elevation: 4.0,
        shadowColor: Colors.grey.shade400,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.school,
            color: Colors.white,
            size: 60,
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
                //Navigate to the SignUp page
                Get.to(() => const SignUpPage());
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
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: constraints.maxWidth > 800 ? 600 : 400,
                    height: constraints.maxWidth > 800 ? 600 : 400,
                    child: Image.asset(
                      "lib/assets/design-and-development-process.png",
                    ),
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Students Corner",
                          style: TextStyle(
                              fontSize: constraints.maxWidth * 0.06,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "This is the Ultimate web for student management.",
                          style: TextStyle(
                              fontSize: constraints.maxWidth * 0.040,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 115, 46, 233),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(23)),
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
                              onPressed: () {
                                Get.to(() => LogInPage());
                              },
                              child: const Text(
                                "Log In",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.shade100,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(23)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade600,
                                  offset: const Offset(0, 3),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            width: 150,
                            height: 50,
                            child: TextButton(
                              onPressed: () {
                                Get.to(() => const InfoPage());
                              },
                              child: const Text(
                                "Learn More",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
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
                              //Navigate to the signUp page
                              Get.to(() => const SignUpPage());
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
