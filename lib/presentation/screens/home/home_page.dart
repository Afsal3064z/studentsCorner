import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

import 'package:studentsapp/presentation/screens/adding_details/adding_details_page.dart';
import 'package:studentsapp/presentation/screens/home/home_controller.dart';
import 'package:studentsapp/presentation/screens/students_details/indivial_details.dart';
import 'package:studentsapp/presentation/screens/landing/landing_page.dart';

class HomePage extends StatelessWidget {
  final RxBool refreshNeeded = true.obs;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    homeController.fetchStudentData(refreshNeeded);

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
            onPressed: () {},
            child: const Icon(
              Icons.school,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LandingPage(),
              ));
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 115, 46, 233),
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddDetailsScreen(),
          ));
          refreshNeeded.value = true;
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Obx(() {
        final studentDataList = homeController.studentDataList;

        if (studentDataList.isNotEmpty) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white24, Color.fromARGB(255, 91, 54, 255)],
              ),
            ),
            child: ListView.builder(
              itemCount: studentDataList.length,
              itemBuilder: (context, index) {
                final studentData = studentDataList[index];
                final studentName =
                    studentData['name'] as String? ?? 'Name not available';
                final studentClass =
                    studentData['class'] as String? ?? 'Class not available';
                final studentRollno =
                    studentData['rollno'] as String? ?? 'Rollno not available';

                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade300,
                    borderRadius: const BorderRadius.all(Radius.circular(14)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        offset: const Offset(0, 3),
                        blurRadius: 10,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => StudentDetailsScreen(
                            studentName: studentName,
                            studentClass: studentClass,
                            studentRoll: studentRollno,
                            studentId: studentData['id'],
                            studentImage: studentData['image'],
                          ),
                        ),
                      );
                    },
                    leading: FutureBuilder<String?>(
                      future: loadImage(studentData['image']),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.data != null) {
                          final byteData =
                              Uint8List.fromList(snapshot.data!.codeUnits);
                          return Container(
                            width: 50,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              image: DecorationImage(
                                image: MemoryImage(byteData),
                                fit: BoxFit.cover,
                                scale: 1,
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            width: 50,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.shade500,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: const Icon(
                              Icons.image,
                              color: Colors.white,
                              size: 30,
                            ),
                          );
                        }
                      },
                    ),
                    title: Text('Name : $studentName',
                        style: const TextStyle(color: Colors.white)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Class : $studentClass",
                            style: const TextStyle(color: Colors.white)),
                        Text('Rollno : $studentRollno',
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        homeController.confirmDeleteStudent(
                            context, studentData['id'], refreshNeeded);
                        // refreshNeeded.value = true; // Removed this line
                      },
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white24, Color.fromARGB(255, 91, 54, 255)],
              ),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade400,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: const Text(
                  'Add details of students.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        }
      }),
    );
  }

  Future<String?> loadImage(String? imageUrl) async {
    try {
      if (imageUrl != null) {
        final response = await http.get(Uri.parse(imageUrl));
        if (response.statusCode == 200) {
          return response.body;
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error loading image: $e');
    }
    return null;
  }
}
