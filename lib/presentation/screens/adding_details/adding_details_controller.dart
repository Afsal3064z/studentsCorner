import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentsapp/presentation/screens/home/home_controller.dart';

class AddDetailsController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController rollController = TextEditingController();
  Rx<FilePickerResult?> selectedImage = Rx<FilePickerResult?>(null);

  // Method to pick an image
  Future<void> pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        selectedImage(result);
      } else {
        // ignore: avoid_print
        print("No file has been selected.");
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error picking file: $e');
    }
  }

  // Method to upload student details
  Future<void> uploadStudentDetails() async {
    if (nameController.text.isEmpty || selectedImage.value == null) {
      showErrorDialog('Please provide student name and select a photo.');
      return;
    }

    if (classController.text.isEmpty) {
      showErrorDialog('Please provide the student class.');
      return;
    }

    if (rollController.text.isEmpty) {
      showErrorDialog('Please provide the student roll number.');
      return;
    }

    final studentName = nameController.text;
    final studentClass = classController.text;
    final rollNo = rollController.text;
    final photoBytes = selectedImage.value!.files.single.bytes!;

    // ignore: unnecessary_null_comparison
    if (photoBytes != null) {
      final photoUrl = await uploadStudentPhoto(studentName, photoBytes);
      await addStudentToFirestore(studentName, rollNo, studentClass, photoUrl);

      showSuccessDialog('Student details added successfully.');
      refreshHomePage();
    }
  }

  // Method to upload student photo to Firebase Storage
  Future<String> uploadStudentPhoto(String studentName, Uint8List bytes) async {
    String fileName = "${DateTime.now().millisecondsSinceEpoch.toString()}.png";

    final storageRef = FirebaseStorage.instance;
    Reference directoryReference = storageRef.ref().child("images");
    Reference imgdirectoryReference = directoryReference.child(fileName);
    final metadata = SettableMetadata(contentType: "image/png");

    await imgdirectoryReference.putData(bytes, metadata);
    final downloadURL = await imgdirectoryReference.getDownloadURL();

    return downloadURL;
  }

  // Method to add student to Firestore
  Future<void> addStudentToFirestore(String studentName, String rollNo,
      String studentClass, String studentPhoto) async {
    final firestore = FirebaseFirestore.instance;
    await firestore.collection('students').add({
      'name': studentName,
      'image': studentPhoto,
      'rollno': rollNo,
      'class': studentClass,
    });
  }

  // Method to clear controllers
  void clearControllers() {
    nameController.clear();
    classController.clear();
    rollController.clear();
    selectedImage.value = null;
  }

  // Method to show error dialog
  void showErrorDialog(String message) {
    Get.dialog(
      AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // Method to show success dialog
  void showSuccessDialog(String message) {
    Get.dialog(
      AlertDialog(
        title: const Text('Success'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // Method to refresh the home page
  void refreshHomePage() {
    homeController.fetchStudentData(RxBool(false));
  }
}

final AddDetailsController addDetailsController =
    Get.put(AddDetailsController());
