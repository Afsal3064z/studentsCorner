import 'package:flutter/material.dart';

//This is the students details page in the app
class StudentDetailsBody extends StatelessWidget {
  final String studentName;
  final String studentClass;
  final String studentRoll;
  final String studentImage;

  const StudentDetailsBody({
    super.key,
    required this.studentName,
    required this.studentClass,
    required this.studentRoll,
    required this.studentImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white24, Color.fromARGB(255, 91, 54, 255)],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 5),
                    blurRadius: 6,
                    spreadRadius: 0,
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: Colors.deepPurple,
              ),
              width: 250,
              height: 250,
              //Will show the image of the student
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: studentImage.isNotEmpty
                    ? Image.network(
                        studentImage,
                        fit: BoxFit.cover,
                        width: 150,
                        height: 150,
                      )
                    : const Icon(
                        Icons.image,
                        color: Colors.white,
                        size: 40,
                      ),
              ),
            ),
            const SizedBox(height: 20),
            //To show the name of the student
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.deepPurple.shade400,
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: Text(
                'Name: $studentName',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            //To show the class of the student
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.deepPurple.shade400,
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: Text(
                'Class: $studentClass',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            //To show the roll no of  the student
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.deepPurple.shade400,
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: Text(
                'RollNo: $studentRoll',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
