import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentsapp/presentation/screens/edit_details/edit_details_controller.dart';

class EditStudentDetailsScreen extends StatelessWidget {
  final String studentName;
  final String studentClass;
  final String studentRoll;
  final String studentDocumentId;

  const EditStudentDetailsScreen({
    super.key,
    required this.studentName,
    required this.studentClass,
    required this.studentRoll,
    required this.studentDocumentId,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize controller with actual values
    editStudentDetailsController.initData(
      studentName,
      studentClass,
      studentRoll,
      studentDocumentId,
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 30,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 115, 46, 233),
        title: const Text(
          "Edit Student Details",
          style: TextStyle(color: Colors.white),
        ),
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
                width: 150,
                height: 150,
                child: const Icon(
                  Icons.image,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //This is the text form field to edit the name of the student
              buildTextFormField(
                label: 'Enter Student Name',
                initialValue: editStudentDetailsController.editedName,
                onChanged: (value) {
                  editStudentDetailsController.editedName = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              //This is the text form field to edit the class of the student
              buildTextFormField(
                label: 'Enter Student Class',
                initialValue: editStudentDetailsController.editedClass,
                onChanged: (value) {
                  editStudentDetailsController.editedClass = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              //This is the text field to edit the student roll no
              buildTextFormField(
                label: 'Enter Student Roll',
                initialValue: editStudentDetailsController.editedRoll,
                onChanged: (value) {
                  editStudentDetailsController.editedRoll = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              //These are the button to save / cancel the edit by the user to the details of the student
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildTextButton(
                    label: 'Save',
                    onPressed: editStudentDetailsController.saveEditedDetails,
                    color: Colors.green.shade400,
                  ),
                  const SizedBox(width: 20),
                  buildTextButton(
                    label: 'Cancel',
                    onPressed: editStudentDetailsController.cancelEdit,
                    color: Colors.red.shade400,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField({
    required String label,
    required String initialValue,
    required void Function(String) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 5),
            blurRadius: 6,
            spreadRadius: 0,
          )
        ],
        color: Colors.deepPurple.shade300,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      width: 300,
      height: 50,
      child: TextFormField(
        controller: TextEditingController(text: initialValue),
        onChanged: onChanged,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white),
          hintText: label,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }

  Widget buildTextButton({
    required String label,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 5),
            blurRadius: 6,
            spreadRadius: 0,
          )
        ],
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(23)),
      ),
      width: 150,
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
