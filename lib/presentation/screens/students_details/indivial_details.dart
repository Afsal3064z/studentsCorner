import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentsapp/presentation/screens/edit_details/edit_student_details_screen.dart';
import 'package:studentsapp/presentation/screens/home/home_page.dart';
import 'package:studentsapp/presentation/screens/students_details/students_details_body.dart';

//This is the event  / function on the indivdual students details
class StudentDetailsScreen extends StatelessWidget {
  final String studentId;
  final String studentName;
  final String studentClass;
  final String studentRoll;
  final String studentImage;

  const StudentDetailsScreen({
    super.key,
    required this.studentName,
    required this.studentClass,
    required this.studentRoll,
    required this.studentId,
    required this.studentImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.off(() => HomePage());
          },
          icon: const Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 30,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 115, 46, 233),
        title: const Text(
          "Student Details",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(() => EditStudentDetailsScreen(
                    studentName: studentName,
                    studentClass: studentClass,
                    studentRoll: studentRoll,
                    studentDocumentId: studentId,
                  ));
            },
          ),
        ],
      ),
      body: StudentDetailsBody(
        studentName: studentName,
        studentClass: studentClass,
        studentRoll: studentRoll,
        studentImage: studentImage,
      ),
    );
  }
}
