import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentsapp/core/firebase_auth/firebase_auth_services.dart';
import 'package:studentsapp/presentation/screens/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Firebase only if it hasn't been initialized
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBXD66xw5cfrOa_h0BPS5seglQkJzDs8ho",
        authDomain: "studentsapp-39a91.firebaseapp.com",
        databaseURL: "https://studentsapp-39a91-default-rtdb.firebaseio.com",
        projectId: "studentsapp-39a91",
        storageBucket: "studentsapp-39a91.appspot.com",
        messagingSenderId: "465223110265",
        appId: "1:465223110265:web:fd43677f16d8e5f0af8ea8",
        measurementId: "G-B3R4VTJHJ0",
      ),
    );

    // Initialize FirebaseAuthService using Get.put
    Get.put(FirebaseAuthService());
  } catch (e) {
    // ignore: avoid_print
    print("Firebase initialization error: $e");
    return;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_super_parameters
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Students App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 115, 46, 233),
        ),
        useMaterial3: true,
      ),
      home: LogInPage(),
    );
  }
}
